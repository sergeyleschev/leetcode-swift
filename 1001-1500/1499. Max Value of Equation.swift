class Solution {

    // Solution by Sergey Leschev

    // 1499. Max Value of Equation
    // You are given an array points containing the coordinates of points on a 2D plane, sorted by the x-values, where points[i] = [xi, yi] such that xi < xj for all 1 <= i < j <= points.length. You are also given an integer k.
    // Return the maximum value of the equation yi + yj + |xi - xj| where |xi - xj| <= k and 1 <= i < j <= points.length.
    // It is guaranteed that there exists at least one pair of points that satisfy the constraint |xi - xj| <= k.

    // Example 1:
    // Input: points = [[1,3],[2,0],[5,10],[6,-10]], k = 1
    // Output: 4
    // Explanation: The first two points satisfy the condition |xi - xj| <= 1 and if we calculate the equation we get 3 + 0 + |1 - 2| = 4. Third and fourth points also satisfy the condition and give a value of 10 + -10 + |5 - 6| = 1.
    // No other pairs satisfy the condition, so we return the max of 4 and 1.

    // Example 2:
    // Input: points = [[0,0],[3,0],[9,2]], k = 3
    // Output: 3
    // Explanation: Only the first two points have an absolute difference of 3 or less in the x-values, and give the value of 0 + 0 + |0 - 3| = 3.

    // Constraints:
    // 2 <= points.length <= 10^5
    // points[i].length == 2
    // -10^8 <= xi, yi <= 10^8
    // 0 <= k <= 2 * 10^8
    // xi < xj for all 1 <= i < j <= points.length
    // xi form a strictly increasing sequence.

    func findMaxValueOfEquation(_ points: [[Int]], _ k: Int) -> Int {
        var result = Int.min
        var right = 0
        var currentX = 0

        for left in 0..<points.count - 1 { // for each possible left point (meaning we have the max) for each possible coordinate
            var currentResult = Int.min // The current result is for the left coordinate            
            
            if (currentX > left && currentX <= right) { // if currentX is viable (from the previous X)
                currentResult = points[currentX][0] - points[left][0] + points[left][1] + points[currentX][1] // set the current result for this left
            }
            right = currentX + 1 > left ? currentX + 1 : left + 1 // set the right pointer to the right of the previous currentX, or to the right of the left pointer

            // set up the while loop that will find the max currentResult for any particular right pointer which matches the current left pointer
            // while the right is in bounds, and the question condition that xᵢ - xⱼ < k
            while (right <= points.count - 1 && points[right][0] - points[left][0] <= k) {
                let prospectiveResult = points[right][0] - points[left][0] + points[left][1] + points[right][1] // calculate the prospective result
                if (prospectiveResult >= currentResult) { // if the prospectiveResult is larger than the currentResult
                    currentResult = prospectiveResult // if we have a larger result, record it
                    currentX = right // record the right pointer as currentX
                }
                right += 1 // slide the right pointer right
            }

            result = max(result, currentResult) // record the largest result for this left - if it is larger than the current
        }

        return result
    }

}