class Solution {

    // Solution @ Sergey Leschev

    // 812. Largest Triangle Area
    // You have a list of points in the plane. Return the area of the largest triangle that can be formed by any 3 of the points.

    // Example:
    // Input: points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
    // Output: 2
    // Explanation: 
    // The five points are show in the figure below. The red triangle is the largest.

    // Notes:
    // 3 <= points.length <= 50.
    // No points will be duplicated.
    // -50 <= points[i][j] <= 50.
    // Answers within 10^-6 of the true value will be accepted as correct.

    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var ans = 0.0


        func triangleArea(p1: [Int], p2: [Int], p3: [Int]) -> Double {
            0.5 * abs(Double(p1[0] * (p2[1] - p3[1]) + p2[0] * (p3[1] - p1[1]) + p3[0] * (p1[1] - p2[1])))
        }
        
        
        for i in 0..<points.count {
            for j in i + 1..<points.count {
                for k in j + 1..<points.count {
                   ans = max(ans, triangleArea(p1: points[i], p2: points[j], p3: points[k]))
                }
            }
        }
        
        return ans
    }

}