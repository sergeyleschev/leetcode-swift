class Solution {

	// Solution @ Sergey Leschev

	// 119. Pascal's Triangle II
	// Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
	// In Pascal's triangle, each number is the sum of the two numbers directly above it as shown.

	// Finds the k-th index row of the Pascal's triangle.
    // - Parameter rowIndex: Non-negative index k.
    // - Returns: K-th index row of the Pascal's triangle.

	// Example 1:
	// Input: rowIndex = 3
	// Output: [1,3,3,1]

	// Example 2:
	// Input: rowIndex = 0
	// Output: [1]

	// Example 3:
	// Input: rowIndex = 1
	// Output: [1,1]
	 
	// Constraints:
	// 0 <= rowIndex <= 33
	 
	// Follow up: Could you optimize your algorithm to use only O(rowIndex) extra space?

    // - Complexity:
    //   - time: O(k), where k is the rowIndex.
    //   - space: O(k), where k is the rowIndex.
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = Array(repeating: 0, count: rowIndex + 1)
		row[0] = 1
		var index = 0
		
        while index <= rowIndex {
			for i in 0...index / 2 {
				let a = i > 0 ? row[i - 1] : 0
				let b = row[i]
				row[index - i] = a + b
			}
			
            for i in 0...index / 2 {
				row[i] = row[index - i]
			}
			
            index += 1
		}
        
		return row
    }

}