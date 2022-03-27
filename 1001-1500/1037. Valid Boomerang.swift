class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1037. Valid Boomerang
    // Given an array points where points[i] = [xi, yi] represents a point on the X-Y plane, return true if these points are a boomerang.
    // A boomerang is a set of three points that are all distinct and not in a straight line.

    // Example 1:
    // Input: points = [[1,1],[2,3],[3,2]]
    // Output: true

    // Example 2:
    // Input: points = [[1,1],[2,2],[3,3]]
    // Output: false

    // Constraints:
    // points.length == 3
    // points[i].length == 2
    // 0 <= xi, yi <= 100

    func isBoomerang(_ points: [[Int]]) -> Bool {
        var i = 0
        var preGradient: Float = 0
        
        while i < points.count - 1 {
            let point1 = points[i]
            let point2 = points[i + 1]
            var gradient: Float = 0
            
            if point1[0] == point2[0], point1[1] == point2[1] { return false }
            
            if point2[0] - point1[0] == 0 {
                gradient = Float(Int.max)
            } else {
                gradient = Float((point2[1] - point1[1])) / Float((point2[0] - point1[0]))
            }
            
            if i > 0 && gradient == preGradient { return false }
            preGradient = gradient
            i += 1
        }
        
        return true
    }
    
}