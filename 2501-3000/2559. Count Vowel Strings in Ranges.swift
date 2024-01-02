class Solution {

    // Solution by Sergey Leschev
    // 2559. Count Vowel Strings in Ranges

    func check(_ c: Character) -> Bool {
        return c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
    }

    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        var v = [0]
        for w in words {
            if check(w.first!) && check(w.last!) {
                v.append(v.last! + 1)
            } else {
                v.append(v.last!)
            }
        }

        var ans = [Int]()
        for q in queries {
            ans.append(v[q[1] + 1] - v[q[0]])
        }

        return ans
    }
}
