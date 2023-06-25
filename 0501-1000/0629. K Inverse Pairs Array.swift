class Solution {

    // Solution @ Sergey Leschev

    // 629. K Inverse Pairs Array
    // For an integer array nums, an inverse pair is a pair of integers [i, j] where 0 <= i < j < nums.length and nums[i] > nums[j].
    // Given two integers n and k, return the number of different arrays consist of numbers from 1 to n such that there are exactly k inverse pairs. Since the answer can be huge, return it modulo 109 + 7.

    // Example 1:
    // Input: n = 3, k = 0
    // Output: 1
    // Explanation: Only the array [1,2,3] which consists of numbers from 1 to 3 has exactly 0 inverse pairs.

    // Example 2:
    // Input: n = 3, k = 1
    // Output: 2
    // Explanation: The array [1,3,2] and [2,1,3] have exactly 1 inverse pair.

    // Constraints:
    // 1 <= n <= 1000
    // 0 <= k <= 1000

    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let modulo = 1000000007
        var dp = [1]
        
        for i in 2..<n + 1 {
            var ndp = [Int]()
            var num = 0
            for j in 0...min(1 + i * (i - 1) / 2, k + 1) {
                if j < dp.count { num = (num + dp[j]) % modulo }
                if j >= i { num = (modulo + num - dp[j - i]) % modulo }
                ndp.append(num)
            }
            dp = ndp
        }
        
        return k < dp.count ? dp[k] : 0
    }

}