class Solution {

    // Solution @ Sergey Leschev

    // 1453. Maximum Number of Darts Inside of a Circular Dartboard
    // You have a very large square wall and a circular dartboard placed on the wall. You have been challenged to throw darts into the board blindfolded. Darts thrown at the wall are represented as an array of points on a 2D plane. 
    // Return the maximum number of points that are within or lie on any circular dartboard of radius r.

    // Example 1:
    // Input: points = [[-2,0],[2,0],[0,2],[0,-2]], r = 2
    // Output: 4
    // Explanation: Circle dartboard with center in (0,0) and radius = 2 contain all points.

    // Example 2:
    // Input: points = [[-3,0],[3,0],[2,6],[5,4],[0,9],[7,8]], r = 5
    // Output: 5
    // Explanation: Circle dartboard with center in (0,4) and radius = 5 contain all points except the point (7,8).

    // Example 3:
    // Input: points = [[-2,0],[2,0],[0,2],[0,-2]], r = 1
    // Output: 1

    // Example 4:
    // Input: points = [[1,2],[3,5],[1,-1],[2,3],[4,1],[1,3]], r = 2
    // Output: 4

    // Constraints:
    // 1 <= points.length <= 100
    // points[i].length == 2
    // -10^4 <= points[i][0], points[i][1] <= 10^4
    // 1 <= r <= 5000

    private struct Point {
        var x: Double
        var y: Double

        func distance(to  another: Point) -> Double { sqrt((x - another.x) * (x - another.x) + (y - another.y) * (y - another.y )) }
    }


    func numPoints(_ points: [[Int]], _ r: Int) -> Int {
        guard points.count > 1 else { return points.count }
        let doublePoints = points.map {$0.map {Double($0)}}.map { (arr) -> Point in Point(x: arr[0], y: arr[1]) }
        let doubleRadius = Double(r)
        let error = 1e-6
        guard points.count > 2 else { return  doublePoints[0].distance(to: doublePoints[1]) - 2.0 * doubleRadius <= error ? 2 : 1 }
        let n = points.count
        var ans = Int.min


        func count(center: Point) -> Int {
            var cnt = 0
            for point in doublePoints where center.distance(to: point) - doubleRadius <= error { cnt += 1 }
            return cnt
        }

        func getCenters(_ one: Point, _ another: Point) -> (Point,Point) {
            let mid = Point(x: (one.x + another.x) / 2.0, y: (one.y + another.y) / 2.0)
            let dis1 = mid.distance(to: one)
            let dis2 = sqrt(doubleRadius * doubleRadius - dis1 * dis1)
            var dirX = 0.0
            var dirY = 0.0

            if one.x == another.x {
                dirY = 1.0
            } else if one.y == another.y {
                dirX = 1.0
            } else {
                let dx = one.x - another.x
                let dy = one.y - another.y
                let dis3 = Point(x: 0, y: 0).distance(to: Point(x: dx, y: dy))
                dirX = dy / dis3
                dirY = -dx / dis3
            }
            return (Point(x: mid.x + dis2 * dirX, y: mid.y + dis2 * dirY),Point(x: mid.x - dis2 * dirX, y: mid.y - dis2 * dirY))
        }

        for i in 0..<(n - 1) {
            for j in (i + 1)..<n {
                let dis = doublePoints[i].distance(to: doublePoints[j])
                guard dis - 2.0 * doubleRadius <= error else { continue }
                let centers = getCenters(doublePoints[i], doublePoints[j])
                ans = max(ans, count(center: centers.0),count(center: centers.1))
            }
        }
        return max(1,ans)
    }

}