class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 939. Minimum Area Rectangle
    // Given a set of points in the xy-plane, determine the minimum area of a rectangle formed from these points, with sides parallel to the x and y axes.
    // If there isn't any rectangle, return 0.

    // Example 1:
    // Input: [[1,1],[1,3],[3,1],[3,3],[2,2]]
    // Output: 4

    // Example 2:
    // Input: [[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]
    // Output: 2

    // Note:
    // 1 <= points.length <= 500
    // 0 <= points[i][0] <= 40000
    // 0 <= points[i][1] <= 40000
    // All points are distinct.

    func minAreaRect(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        var set = Set<Int>()
        var minArea = Int.max

        for point in points { set.insert(point[0] * 40000 + point[1]) }

        for i in 0..<points.count {
            let x0 = points[i][0]
            let y0 = points[i][1]
            
            var j = i + 1
            while j < points.count {
                let x1 = points[j][0]
                let y1 = points[j][1]

                if x0 != x1, y0 != y1, set.contains(x0 * 40000 + y1), set.contains(x1 * 40000 + y0) {
                    minArea = min(minArea, abs(x0 - x1) * abs(y0 - y1))
                }
                
                j += 1
            }
        }

        return minArea == Int.max ? 0 : minArea
    }
    
}