class Solution {

    // Solution by Sergey Leschev
    // 2843. Count Symmetric Integers

    // Time complexity: O(n∗k) where k is the length of the digits of the number
    // Space complexity: O(1)

    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        var count = 0

        for i in low...high {
            if isSymmetric(i) {
                count += 1
            }
        }

        return count
    }

    func isSymmetric(_ n: Int) -> Bool {
        let s = String(n)
        let len = s.count

        if len % 2 == 1 {
            return false
        }

        let mid = len / 2
        var s1 = 0
        var s2 = 0

        for i in 0..<mid {
            let index1 = s.index(s.startIndex, offsetBy: i)
            let index2 = s.index(s.startIndex, offsetBy: len - i - 1)
            s1 += Int(String(s[index1]))!
            s2 += Int(String(s[index2]))!
        }

        return s1 == s2
    }
}
