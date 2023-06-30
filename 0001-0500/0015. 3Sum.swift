class Solution {

    // Solution by Sergey Leschevs

    // 15. 3Sum
    // Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
    // Notice that the solution set must not contain duplicate triplets.

    // Example 1:
    // Input: nums = [-1,0,1,2,-1,-4]
    // Output: [[-1,-1,2],[-1,0,1]]

    // Example 2:
    // Input: nums = []
    // Output: []

    // Example 3:
    // Input: nums = [0]
    // Output: []
     
    // Constraints:
    // 0 <= nums.length <= 3000
    // -10^5 <= nums[i] <= 10^5

    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var res: [[Int]] = []
        let sorted = nums.sorted()
        var i = 0
        
        while i < sorted.count - 2 {
            if i > 0, sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            
            var j = i + 1
            var k = sorted.count - 1
            
            while j < k {
                let target = sorted[i] + sorted[j] + sorted[k]
                if (target == 0) {
                    if j - 1 > i, sorted[j] == sorted[j - 1] {
                        j += 1
                        continue
                    } 
                    res.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                } else if (target < 0) {
                    j += 1
                } else {
                    k -= 1
                }
            }
            i += 1
        }
        
        return res
    }
    
}