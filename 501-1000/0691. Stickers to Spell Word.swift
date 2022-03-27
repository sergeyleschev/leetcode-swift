class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 691. Stickers to Spell Word
    // We are given n different types of stickers. Each sticker has a lowercase English word on it.
    // You would like to spell out the given string target by cutting individual letters from your collection of stickers and rearranging them. You can use each sticker more than once if you want, and you have infinite quantities of each sticker.
    // Return the minimum number of stickers that you need to spell out target. If the task is impossible, return -1.
    // Note: In all test cases, all words were chosen randomly from the 1000 most common US English words, and target was chosen as a concatenation of two random words.

    // Example 1:
    // Input: stickers = ["with","example","science"], target = "thehat"
    // Output: 3
    // Explanation:
    // We can use 2 "with" stickers, and 1 "example" sticker.
    // After cutting and rearrange the letters of those stickers, we can form the target "thehat".
    // Also, this is the minimum number of stickers necessary to form the target string.

    // Example 2:
    // Input: stickers = ["notice","possible"], target = "basicbasic"
    // Output: -1
    // Explanation:
    // We cannot form the target "basicbasic" from cutting letters from the given stickers.

    // Constraints:
    // n == stickers.length
    // 1 <= n <= 50
    // 1 <= stickers[i].length <= 10
    // 1 <= target <= 15
    // stickers[i] and target consist of lowercase English letters.

    func minStickers(_ stickers: [String], _ target: String) -> Int {
        let n = stickers.count, alph = ("a"..."z").array!
        let map = [Int](repeating: 0, count: alph.count)
        var freq = [[Int]](repeating: map, count: n)
        var memo = [String:Int]()

        memo[""] = 0
        
        for i in 0..<n { for char in stickers[i] { freq[i][char.ascii - 97] += 1 } }
        
        return helper(&freq, target, &memo)
    }

    
    private func helper(_ freq: inout [[Int]], _ target: String,_ memo: inout [String:Int]) -> Int {
        if let num = memo[target] { return num }
        var res = Int.max
        var cnt = [Int](repeating:0, count: 26)
        target.forEach({ cnt[$0.ascii - 97] += 1 })
        
        for i in 0..<freq.count {
            if freq[i][target[0].ascii - 97] == 0 { continue }
            var t = ""
            for j in 0..<26 {
                if cnt[j] - freq[i][j] > 0 {
                    for _ in 0..<(cnt[j] - freq[i][j]) { t.append((97 + j).ASCII) }
                }
            }
            let ans = helper(&freq, t, &memo)
            if ans != -1 {res = min(res, ans + 1)}
        }

        memo[target, default: 0] = (res == Int.max) ? -1 : res
        return memo[target,default:0]
    }
}


extension String {
    subscript (_ i: Int) -> Character { get { return self[index(startIndex, offsetBy: i)] } }
}


extension Character {
    var ascii: Int { get { return Int(unicodeScalars.first?.value ?? 0) } }
}


extension Int {
    var ASCII: Character { get { return Character(UnicodeScalar(self)!) } }
}


extension ClosedRange where Bound == UnicodeScalar {
    func toArray() -> [UnicodeScalar] { (lowerBound.value...upperBound.value).compactMap { UnicodeScalar($0) } }
}


extension ClosedRange where Bound == String {
    private func toArray() -> [UnicodeScalar]? {
        guard let lower = lowerBound.first?.unicodeScalars.first,
              let upper = upperBound.first?.unicodeScalars.first else { return nil }
        return (lower...upper).toArray()
    }

    var array: [UnicodeScalar]? { self.toArray() }
}