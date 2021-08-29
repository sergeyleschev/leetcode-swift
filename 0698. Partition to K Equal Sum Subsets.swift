class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 698. Partition to K Equal Sum Subsets
    // Given an integer array nums and an integer k, return true if it is possible to divide this array into k non-empty subsets whose sums are all equal.

    // Example 1:
    // Input: nums = [4,3,2,3,5,2,1], k = 4
    // Output: true
    // Explanation: It's possible to divide it into 4 subsets (5), (1, 4), (2,3), (2,3) with equal sums.

    // Example 2:
    // Input: nums = [1,2,3,4], k = 3
    // Output: false

    // Constraints:
    // 1 <= k <= nums.length <= 16
    // 1 <= nums[i] <= 10^4
    // The frequency of each element is in the range [1, 4].
    
    func helper(_ p: Int, _ k: Int, _ target: Int, _ sum: Int, _ nums: inout [Int], _ visited: inout [Bool]) -> Bool {
        if k == 1 { return true }
        if sum == target { return helper(0, k - 1, target, 0, &nums, &visited) }
        
        for i in p..<nums.count {
            if visited[i] { continue }
            if sum + nums[i] > target { break }
            visited[i] = true
            if helper(i + 1, k, target, sum + nums[i], &nums, &visited) { return true }
            visited[i] = false
        }

        return false
    }

    
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        guard !nums.isEmpty && nums.count >= k else { return false }
        
        let sum = nums.reduce(0) { $0 + $1 }
        if sum % k > 0 { return false }
        let target = sum / k
        
        var nums = nums.sorted()
        var visited = Array(repeating: false, count: nums.count)
        return helper(0, k, target, 0, &nums, &visited)
    }
  
}