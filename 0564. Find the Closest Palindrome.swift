class Solution {

    // 564. Find the Closest Palindrome
    // Given a string n representing an integer, return the closest integer (not including itself), which is a palindrome. If there is a tie, return the smaller one.
    // The closest is defined as the absolute difference minimized between two integers.

    // Example 1:
    // Input: n = "123"
    // Output: "121"

    // Example 2:
    // Input: n = "1"
    // Output: "0"
    // Explanation: 0 and 2 are the closest palindromes but we return the smallest which is 0.

    // Constraints:
    // 1 <= n.length <= 18
    // n consists of only digits.
    // n does not have leading zeros.
    // n is representing an integer in the range [1, 10^18 - 1].

    // - Complexity:
    //   - time: O(n / 2)
    //   - space: O(1)

    func nearestPalindromic(_ n: String) -> String {
        let size = n.count
        if size == 1 { return String(Int(n)!-1) }

        var candidates = getInitCandidates(size)
        var s = Array(n)
        var nearStr = String()
        let val = Int(n)!
        var minDiff = Int.max

        var half = Int(String(s[0..<(size+1)/2]))!
        for leftHalf in [half-1, half, half+1] {
            var temp = leftHalf
            var even = leftHalf * 10 + temp%10
            var odd = leftHalf

            temp /= 10
            while temp != 0 {
                even = even*10 + temp%10
                odd = odd*10 + temp%10

                temp /= 10
            }

            candidates.append(even)
            candidates.append(odd)
        }

        candidates.sort()

        for c in candidates {
            if c == val { continue }
            let diff = abs(c-val)
            if diff < minDiff {
                minDiff = diff
                nearStr = String(c)
            }
        }
        
        return nearStr
    }


    func getInitCandidates(_ n: Int) -> [Int] {
        var res = [Int]()
        let tempN = Int(pow(Double(10), Double(n)))
        let tempN1 = Int(pow(Double(10), Double(n-1)))

        res.append(tempN1-1)
        res.append(tempN1+1)
        res.append(tempN-1)
        res.append(tempN+1)
        return res
    }

}