class Solution {

    // Solution @ Sergey Leschev

    // 1695. Maximum Erasure Value
    // You are given an array of positive integers nums and want to erase a subarray containing unique elements. The score you get by erasing the subarray is equal to the sum of its elements.

    // Return the maximum score you can get by erasing exactly one subarray.

    // An array b is called to be a subarray of a if it forms a contiguous subsequence of a, that is, if it is equal to a[l],a[l+1],...,a[r] for some (l,r).

    // Example 1:
    // Input: nums = [4,2,4,5,6]
    // Output: 17
    // Explanation: The optimal subarray here is [2,4,5,6].

    // Example 2:
    // Input: nums = [5,2,1,2,5,2,1,2,5]
    // Output: 8
    // Explanation: The optimal subarray here is [5,2,1] or [1,2,5].

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^4

    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.isEmpty ? 0 : nums[0] }
        let n = nums.count
        var left = 0
        var right = 0
        var visited = [Int](repeating: -1, count: nums.max()! + 1)
        var ans = Int.min
        var curSum = 0

        while right < n {
            while right < n && visited[nums[right]] == -1 {
                curSum += nums[right]
                visited[nums[right]] = right
                right += 1
            }
            ans = max(curSum, ans)
            while right < n && left < right && left <= visited[nums[right]] {
                curSum -= nums[left]
                visited[nums[left]] = -1
                left += 1
            }
        }
        return ans
    }

}