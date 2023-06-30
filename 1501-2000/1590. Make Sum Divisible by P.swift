class Solution {

    // Solution by Sergey Leschev

    // 1590. Make Sum Divisible by P
    // Given an array of positive integers nums, remove the smallest subarray (possibly empty) such that the sum of the remaining elements is divisible by p. It is not allowed to remove the whole array.
    // Return the length of the smallest subarray that you need to remove, or -1 if it's impossible.
    // A subarray is defined as a contiguous block of elements in the array.

    // Example 1:
    // Input: nums = [3,1,4,2], p = 6
    // Output: 1
    // Explanation: The sum of the elements in nums is 10, which is not divisible by 6. We can remove the subarray [4], and the sum of the remaining elements is 6, which is divisible by 6.

    // Example 2:
    // Input: nums = [6,3,5,2], p = 9
    // Output: 2
    // Explanation: We cannot remove a single element to get a sum divisible by 9. The best way is to remove the subarray [5,2], leaving us with [6,3] with sum 9.

    // Example 3:
    // Input: nums = [1,2,3], p = 3
    // Output: 0
    // Explanation: Here the sum is 6. which is already divisible by 3. Thus we do not need to remove anything.

    // Example 4:
    // Input: nums = [1,2,3], p = 7
    // Output: -1
    // Explanation: There is no way to remove a subarray in order to get a sum divisible by 7.

    // Example 5:
    // Input: nums = [1000000000,1000000000,1000000000], p = 3
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^9
    // 1 <= p <= 10^9

    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        guard p != 1 else { return 0 }
        let mod = nums.reduce(0) { ($0 + $1) % p }
        guard mod != 0 else { return 0 }
        var rMod = 0
        var minW = nums.count
        var pos = [Int: Int]()
        
        pos[0] = -1
        
        for idx in 0..<nums.count {
            rMod = (rMod + nums[idx]) % p
            let cmp = (p - mod + rMod) % p
            if let idx2 = pos[cmp] { minW = min(minW, idx - idx2) }
            pos[rMod] = idx
        }
        return minW >= nums.count ? -1 : minW
    }

}