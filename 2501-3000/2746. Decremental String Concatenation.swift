class Solution {

    // Solution by Sergey Leschev
    // 2746. Decremental String Concatenation
    // DP

    var dp: [[[Int]]] = Array(
        repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 1001)

    func solve(_ words: [String], _ i: Int, _ firstChar: Character, _ lastChar: Character) -> Int {
        if i >= words.count {
            return 0
        }
        if dp[i][Int(firstChar.asciiValue!) - 97][Int(lastChar.asciiValue!) - 97] != 0 {
            return dp[i][Int(firstChar.asciiValue!) - 97][Int(lastChar.asciiValue!) - 97]
        }

        var res1: Int
        var res2: Int
        let wordSize = words[i].count

        // When word is kept first & then the ans string
        res1 = wordSize + solve(words, i + 1, words[i].first!, lastChar)
        if words[i].last! == firstChar {
            res1 -= 1
        }

        // When word is kept at last after the ans string
        res2 = wordSize + solve(words, i + 1, firstChar, words[i].last!)
        if words[i].first! == lastChar {
            res2 -= 1
        }

        dp[i][Int(firstChar.asciiValue!) - 97][Int(lastChar.asciiValue!) - 97] = min(res1, res2)
        return dp[i][Int(firstChar.asciiValue!) - 97][Int(lastChar.asciiValue!) - 97]
    }

    func minimizeConcatenatedLength(_ words: [String]) -> Int {
        return words[0].count + solve(words, 1, words[0].first!, words[0].last!)
    }
}
