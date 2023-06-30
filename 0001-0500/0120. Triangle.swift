class Solution {

	// Solution by Sergey Leschev

	// 120. Triangle
	// Given a triangle array, return the minimum path sum from top to bottom.
	// For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

	// Example 1:
	// Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
	// Output: 11
	// Explanation: The triangle looks like:
	//    2
	//   3 4
	//  6 5 7
	// 4 1 8 3
	// The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

	// Example 2:
	// Input: triangle = [[-10]]
	// Output: -10
	 
	// Constraints:
	// 1 <= triangle.length <= 200
	// triangle[0].length == 1
	// triangle[i].length == triangle[i - 1].length + 1
	// -10^4 <= triangle[i][j] <= 10^4

	// Follow up: Could you do this using only O(n) extra space, where n is the total number of rows in the triangle?

    func minimumTotal(_ triangle: [[Int]]) -> Int {
		var paths: [Int] = Array(repeating: Int.max, count: triangle.count)
        var minimum = Int.max
        
        paths[0] = triangle[0][0]
        for i in 0..<triangle.count {
			for j in 0...i {
				let index = i - j
				let path = index > 0 ? min(paths[index], paths[index - 1]) : paths[index]
				let current = i > 0 ? triangle[i][index] : 0
				paths[index] = current + path
			}
		}
        
		for path in paths { minimum = minimum < path ? minimum : path }
        return minimum
    }
    
}