class Solution {

    // Solution by Sergey Leschev

    // 995. Minimum Number of K Consecutive Bit Flips
    // In an array nums containing only 0s and 1s, a k-bit flip consists of choosing a (contiguous) subarray of length k and simultaneously changing every 0 in the subarray to 1, and every 1 in the subarray to 0.
    // Return the minimum number of k-bit flips required so that there is no 0 in the array.  If it is not possible, return -1.

    // Example 1:
    // Input: nums = [0,1,0], k = 1
    // Output: 2
    // Explanation: Flip nums[0], then flip nums[2].

    // Example 2:
    // Input: nums = [1,1,0], k = 2
    // Output: -1
    // Explanation: No matter how we flip subarrays of size 2, we can't make the array become [1,1,1].

    // Example 3:
    // Input: nums = [0,0,0,1,0,1,1,0], k = 3
    // Output: 3
    // Explanation:
    // Flip nums[0],nums[1],nums[2]: nums becomes [1,1,1,1,0,1,1,0]
    // Flip nums[4],nums[5],nums[6]: nums becomes [1,1,1,1,1,0,0,0]
    // Flip nums[5],nums[6],nums[7]: nums becomes [1,1,1,1,1,1,1,1]

    // Note:
    // 1 <= nums.length <= 30000
    // 1 <= k <= nums.length

    func minKBitFlips(_ A: [Int], _ K: Int) -> Int { difArr(A, K) }
    

    func difArr(_ A: [Int], _ K: Int) -> Int {
        var arr: [Int] = Array(repeating: 0, count: A.count + 1)
        var cnt = 0
        var ans = 0
        
        for i in 0..<A.count {
            let n = A[i]
            cnt += arr[i]
            if (n + cnt) % 2 == 0 {
                if i + K > A.count { return -1 }
                cnt += 1
                ans += 1
                arr[i + K] -= 1
                arr[i] += 1
            }
        }
        
        return ans
    }

}