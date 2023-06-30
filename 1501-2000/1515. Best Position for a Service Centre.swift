class Solution {

    // Solution by Sergey Leschev

    // 1515. Best Position for a Service Centre
    // A delivery company wants to build a new service centre in a new city. The company knows the positions of all the customers in this city on a 2D-Map and wants to build the new centre in a position such that the sum of the euclidean distances to all customers is minimum.
    // Given an array positions where positions[i] = [xi, yi] is the position of the ith customer on the map, return the minimum sum of the euclidean distances to all customers.
    // In other words, you need to choose the position of the service centre [xcentre, ycentre] such that the following formula is minimized:
    // Answers within 10^-5 of the actual value will be accepted.

    // Example 1:
    // Input: positions = [[0,1],[1,0],[1,2],[2,1]]
    // Output: 4.00000
    // Explanation: As shown, you can see that choosing [xcentre, ycentre] = [1, 1] will make the distance to each customer = 1, the sum of all distances is 4 which is the minimum possible we can achieve.

    // Example 2:
    // Input: positions = [[1,1],[3,3]]
    // Output: 2.82843
    // Explanation: The minimum possible sum of distances = sqrt(2) + sqrt(2) = 2.82843

    // Example 3:
    // Input: positions = [[1,1]]
    // Output: 0.00000

    // Example 4:
    // Input: positions = [[1,1],[0,0],[2,0]]
    // Output: 2.73205
    // Explanation: At the first glance, you may think that locating the centre at [1, 0] will achieve the minimum sum, but locating it at [1, 0] will make the sum of distances = 3.
    // Try to locate the centre at [1.0, 0.5773502711] you will see that the sum of distances is 2.73205.
    // Be careful with the precision!

    // Example 5:
    // Input: positions = [[0,1],[3,2],[4,5],[7,6],[8,9],[11,1],[2,12]]
    // Output: 32.94036
    // Explanation: You can use [4.3460852395, 4.9813795505] as the position of the centre.

    // Constraints:
    // 1 <= positions.length <= 50
    // positions[i].length == 2
    // 0 <= positions[i][0], positions[i][1] <= 100

    private struct Point {
        var x: Double
        var y: Double
    }

    private typealias Direction = (dx:Double,dy:Double)
    
    private let error = 1e-6
    private let directions: [Direction] = [(1,0),(-1,0),(0,1),(0,-1)]
    

    private func square(_ x: Double) -> Double { x * x }
    private func distance(from p: Point, to q: Point) -> Double { sqrt(square(p.x - q.x) + square(p.y - q.y)) }
    private func check(_ points: [Point], _ center: Point) -> Double { points.reduce(0.0) { $0 + distance(from: $1, to: center)} }
    

    private func getOriginalCenter(_ points: [Point]) -> Point {
        let n = points.count
        var center = Point(x: 0, y: 0)
        
        points.forEach { (p) in
            center.x += p.x
            center.y += p.y
        }

        center.x /= Double(n)
        center.y /= Double(n)
        return center
    }
    

    func getMinDistSum(_ positions: [[Int]]) -> Double {
        let points = positions.map {Point(x: Double($0[0]), y: Double($0[1]))}
        var center = getOriginalCenter(points)
        var step = 50.0

        while step > error {
            var flag = false
            let currentDistanceSum = check(points, center)
            for dir in directions {
                let nextCenter = Point(x: center.x + dir.dx * step , y: center.y + dir.dy * step)
                if check(points, nextCenter) < currentDistanceSum {
                    center = nextCenter
                    flag = true
                }
            }
            if !flag { step /= 2.0 }
        }
        
        return check(points, center)
    }

}