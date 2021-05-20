class Solution {

    // 90. Subsets II
    // Given an integer array nums that may contain duplicates, return all possible subsets (the power set).
    // The solution set must not contain duplicate subsets. Return the solution in any order.

    // Example 1:
    // Input: nums = [1,2,2]
    // Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]

    // Example 2:
    // Input: nums = [0]
    // Output: [[],[0]]

    // Constraints:
    // 1 <= nums.length <= 10
    // -10 <= nums[i] <= 10

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        var comb = [Int]()
        
        subset(nums.sorted(), 0, &comb, &ans)
        return Array(ans)
    }
    
    
    func subset(_ nums: [Int], _ index: Int, _ comb: inout [Int], _ ans: inout Set<[Int]>) {
        if index >= nums.count {
            ans.insert(comb)
            
        } else {
            subset(nums, index+1, &comb, &ans)
            
            comb.append(nums[index])
            subset(nums, index+1, &comb, &ans)
            comb.removeLast()
        }
    }
    
}