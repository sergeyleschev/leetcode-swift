class Solution {

    // Solution by Sergey Leschev
    // 2957. Remove Adjacent Almost-Equal Characters

    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func removeAlmostEqualCharacters(_ word: String) -> Int {
        let n = word.count
        var k = 0

        var i = 1
        while i < n {
            let current = word.index(word.startIndex, offsetBy: i)
            let previous = word.index(word.startIndex, offsetBy: i - 1)

            if abs(Int(word[current].asciiValue!) - Int(word[previous].asciiValue!)) <= 1 {

                k += 1
                i += 2
            } else {
                i += 1
            }
        }

        return k
    }
}
