class Solution {

    // Solution by Sergey Leschev

	// 78. Subsets
	// Given an integer array nums of unique elements, return all possible subsets (the power set).
	// The solution set must not contain duplicate subsets. Return the solution in any order.

	// Example 1:
	// Input: nums = [1,2,3]
	// Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

	// Example 2:
	// Input: nums = [0]
	// Output: [[],[0]]

	// Constraints:
	// 1 <= nums.length <= 10
	// -10 <= nums[i] <= 10
	// All the numbers of nums are unique.

    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []


        func backtrack(_ path: [Int], _ max: Int, _ target: Int) {
            if target == 0 {
                res.append([])
                return
            }
            
            if path.count == target {
                res.append(path.map({ nums[$0] }))
                return
            }
            
            var path = path
            
            for index in max+1..<nums.count {
                path.append(index)
                backtrack(path, index, target)
                path.remove(at: path.count - 1)
            }
        }
        
        for i in 0...nums.count {
            backtrack([], -1, i)
        }
        
        return res
    }
    
}