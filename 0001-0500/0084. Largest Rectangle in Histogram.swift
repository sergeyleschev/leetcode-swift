class Solution {

    // Solution @ Sergey Leschev

    // 84. Largest Rectangle in Histogram
    // Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

    // Finds the area of the largest rectangle in the histogram.

    // - Parameter heights: An array of integers.
    // - Returns: The area of the largest rectangle.

    // Example 1:
    // Input: heights = [2,1,5,6,2,3]
    // Output: 10
    // Explanation: The above is a histogram where width of each bar is 1.
    // The largest rectangle is shown in the red area, which has an area = 10 units.

    // Example 2:
    // Input: heights = [2,4]
    // Output: 4
     
    // Constraints:
    // 1 <= heights.length <= 10^5
    // 0 <= heights[i] <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the length of heights.
    //   - space: O(n), where n is the length of heights.

    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        let n = heights.count
        var ans = 0
        
        for i in 0..<n {
            while let curHeight = stack.last, heights[curHeight] >= heights[i] {
                stack.removeLast()
                let curWidth = stack.last ?? -1
                ans = max(ans, heights[curHeight] * (i - curWidth - 1))
            }
            stack.append(i)
        }
        
        while !stack.isEmpty {
            let curHeight = stack.removeLast()
            let curWidth = stack.last ?? -1
            ans = max(ans, heights[curHeight] * (n - curWidth - 1))
        }
        
        return ans
    }

}