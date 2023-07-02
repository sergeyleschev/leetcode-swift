typealias Counter = [Character: Int]

class Solution {

    // Solution by Sergey Leschev

    // 1255. Maximum Score Words Formed by Letters
    // Given a list of words, list of  single letters (might be repeating) and score of every character.
    // Return the maximum score of any valid set of words formed by using the given letters (words[i] cannot be used two or more times).
    // It is not necessary to use all characters in letters and each letter can only be used once. Score of letters 'a', 'b', 'c', ... ,'z' is given by score[0], score[1], ... , score[25] respectively.

    // Example 1:
    // Input: words = ["dog","cat","dad","good"], letters = ["a","a","c","d","d","d","g","o","o"], score = [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
    // Output: 23
    // Explanation:
    // Score  a=1, c=9, d=5, g=3, o=2
    // Given letters, we can form the words "dad" (5+1+5) and "good" (3+2+2+5) with a score of 23.
    // Words "dad" and "dog" only get a score of 21.

    // Example 2:
    // Input: words = ["xxxz","ax","bx","cx"], letters = ["z","a","b","c","x","x","x"], score = [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]
    // Output: 27
    // Explanation:
    // Score  a=4, b=4, c=4, x=5, z=10
    // Given letters, we can form the words "ax" (4+5), "bx" (4+5) and "cx" (4+5) with a score of 27.
    // Word "xxxz" only get a score of 25.

    // Example 3:
    // Input: words = ["leetcode"], letters = ["l","e","t","c","o","d"], score = [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]
    // Output: 0
    // Explanation:
    // Letter "e" can only be used once.

    // Constraints:
    // 1 <= words.length <= 14
    // 1 <= words[i].length <= 15
    // 1 <= letters.length <= 100
    // letters[i].length == 1
    // score.length == 26
    // 0 <= score[i] <= 10
    // words[i], letters[i] contains only lower case English letters.

    private static let permunation = (0...16384).map { $0.binaryDigitArr }
    private let aAsciiValue = Character("a").asciiValue!

    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        let lettersCounter = letters.counter
        var letterScore = [Character: Int]()
        let wordsCounter = words.map { $0.counter }.filter { lettersCounter.canFormed(another: $0) }
        var ans = 0

        func calculateScore(_ counter: Counter) -> Int {
            var ans = 0
            for (ch, val) in counter { if let s = letterScore[ch] { ans += s * val } }
            return ans
        }

        for letter in letters {
            let index = Int(letter.asciiValue! - aAsciiValue)
            if nil == letterScore[letter] { letterScore[letter] = score[index] }
        }

        for i in 1..<Int(pow(2.0, Double(wordsCounter.count))) {
            var tempCounter = [Character: Int]()
            let arr = Solution.permunation[i]
            for j in 0..<arr.count where arr[j] { tempCounter.add(another: wordsCounter[j]) }
            if lettersCounter.canFormed(another: tempCounter) {
                ans = max(ans, calculateScore(tempCounter))
            }
        }

        return ans
    }

}

extension Sequence where Element == Character {
    var counter: [Character: Int] {
        var ans = [Character: Int]()
        for ch in self {
            if let c = ans[ch] {
                ans.updateValue(c + 1, forKey: ch)
            } else {
                ans.updateValue(1, forKey: ch)
            }
        }
        return ans
    }
}

extension Counter {
    func canFormed(another counter: Counter) -> Bool {
        for (ch, c) in counter { guard let num = self[ch], num >= c else { return false } }
        return true
    }

    mutating func add(another counter: Counter) {
        for (ch, val) in counter {
            if let c = self[ch] {
                self.updateValue(c + val, forKey: ch)
            } else {
                self.updateValue(val, forKey: ch)
            }
        }
    }
}

extension Int {
    var binaryDigitArr: [Bool] {
        var temp = self
        var ans = [Bool]()
        while temp > 0 {
            ans.append(temp & 1 == 1)
            temp >>= 1
        }
        return ans
    }
}
