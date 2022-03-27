class Solution {

	// Solution @ Sergey Leschev, Belarusian State University

	// 46. Permutations
	// Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

	// Example 1:
	// Input: nums = [1,2,3]
	// Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

	// Example 2:
	// Input: nums = [0,1]
	// Output: [[0,1],[1,0]]

	// Example 3:
	// Input: nums = [1]
	// Output: [[1]]

	// Constraints:
	// 1 <= nums.length <= 6
	// -10 <= nums[i] <= 10
	// All the integers of nums are unique.

	func permute(_ nums: [Int]) -> [[Int]] {
		var res: [[Int]] = []
        

		func recursion(_ list: [Int], _ rest: [Int]) -> Void {
            for (i, item) in rest.enumerated() {
				var list = list
				var rest = rest

				list.append(item)
				rest.remove(at: i)
				if (list.count == nums.count) { res.append(list) }
                recursion(list, rest)
			}
		}
		recursion([], nums)
		return res
	}

}