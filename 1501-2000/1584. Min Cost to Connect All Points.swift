class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1584. Min Cost to Connect All Points
    // You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].
    // The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.

    // Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.

    // Example 1:
    // Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
    // Output: 20
    // Explanation:
    // We can connect the points as shown above to get the minimum cost of 20.
    // Notice that there is a unique path between every pair of points.

    // Example 2:
    // Input: points = [[3,12],[-2,5],[-4,1]]
    // Output: 18

    // Example 3:
    // Input: points = [[0,0],[1,1],[1,0],[-1,1]]
    // Output: 4

    // Example 4:
    // Input: points = [[-1000000,-1000000],[1000000,1000000]]
    // Output: 4000000

    // Example 5:
    // Input: points = [[0,0]]
    // Output: 0

    // Constraints:
    // 1 <= points.length <= 1000
    // -10^6 <= xi, yi <= 10^6
    // All pairs (xi, yi) are distinct.

    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var visited: [Bool] = Array(repeating: false, count: points.count)
        var dis: [Int] = Array(repeating: Int.max, count: points.count)
        var edges = points.count - 1
        var start = 0, nextPos = 0, minDis = 0, res = 0
        
        visited[0] = true
        
        while edges > 0 {
            minDis = Int.max
            for i in 0..<points.count {
                if visited[i] { continue }
                dis[i] = min(abs(points[start][0] - points[i][0]) + abs(points[start][1] - points[i][1]), dis[i])
                if dis[i] < minDis {
                    minDis = dis[i]
                    nextPos = i
                }
            }
            visited[nextPos] = true
            start = nextPos
            res += minDis
            edges -= 1
        }    
        return res
    }

}