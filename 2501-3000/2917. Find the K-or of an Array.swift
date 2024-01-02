class Solution {

    // Solution by Sergey Leschev
    // 2917. Find the K-or of an Array

    func findKOr(_ nums: [Int], _ k: Int) -> Int {
        var dp = [Int](repeating: 0, count: 31)

        for num in nums {
            var i = 0
            var numCopy = num

            while numCopy > 0 {
                if numCopy & 1 == 1 {
                    dp[i] += 1
                }
                i += 1
                numCopy = numCopy >> 1
            }
        }

        var ans = 0
        var bit = 1

        for i in 0..<31 {
            if dp[i] >= k {
                ans |= bit
            }
            bit <<= 1
        }

        return ans
    }
}
