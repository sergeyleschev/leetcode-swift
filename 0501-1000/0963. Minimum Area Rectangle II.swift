struct Point: Hashable {
    var x: Int
    var y: Int
}


struct Vector {
    var x: Int
    var y: Int
    var squreDistance: Int { x * x + y * y }
    

    init(from: Point, to: Point) {
        self.x = to.x - from.x
        self.y = to.y - from.y
    }

    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }


    func multiply(other vec: Vector) -> Int { x * vec.x + y * vec.y }
    func isVertical(with other: Vector) -> Bool { multiply(other: other) == 0 }
    func add(other vec: Vector) -> Vector { Vector(x: x + vec.x, y: y + vec.y) }
    func getToPoint(from: Point) -> Point { Point(x: x + from.x, y: y + from.y) }
}


class Solution {

    // Solution @ Sergey Leschev

    // 963. Minimum Area Rectangle II
    // Given a set of points in the xy-plane, determine the minimum area of any rectangle formed from these points, with sides not necessarily parallel to the x and y axes.
    // If there isn't any rectangle, return 0.

    // Example 1:
    // Input: [[1,2],[2,1],[1,0],[0,1]]
    // Output: 2.00000
    // Explanation: The minimum area rectangle occurs at [1,2],[2,1],[1,0],[0,1], with an area of 2.

    // Example 2:
    // Input: [[0,1],[2,1],[1,1],[1,0],[2,0]]
    // Output: 1.00000
    // Explanation: The minimum area rectangle occurs at [1,0],[1,1],[2,1],[2,0], with an area of 1.

    // Example 3:
    // Input: [[0,3],[1,2],[3,1],[1,3],[2,1]]
    // Output: 0
    // Explanation: There is no possible rectangle to form from these points.

    // Example 4:
    // Input: [[3,1],[1,1],[0,1],[2,1],[3,3],[3,2],[0,2],[2,3]]
    // Output: 2.00000
    // Explanation: The minimum area rectangle occurs at [2,1],[2,3],[3,3],[3,1], with an area of 2.

    // Note:
    // 1 <= points.length <= 50
    // 0 <= points[i][0] <= 40000
    // 0 <= points[i][1] <= 40000
    // All points are distinct.
    // Answers within 10^-5 of the actual value will be accepted as correct.

    typealias ResultType = (area: Double, point: Point?)
    typealias Parameters = (first:Vector?, second:Vector?, third:Vector?, commonPoint: Point?)

    private var pointsSet = Set<Point>()
    private let doubleMax = Double(Int.max)
    private var calculateRectangles = Set<Set<Point>>()

    func minAreaFreeRect(_ points: [[Int]]) -> Double {
        guard points.count >= 4 else { return 0.0 }
        var ans = doubleMax
        let pointsArr = [Point](points.map{Point(x: $0[0], y: $0[1])})
        let length = points.count

        pointsSet = Set<Point>(pointsArr)
        
        for i in 0..<(length - 2) {
            for j in (i + 1)..<(length - 1) {
                for k in (j + 1)..<length {
                    let points = Set<Point>([pointsArr[i], pointsArr[j], pointsArr[k]])
                    if !calculateRectangles.contains(points) {
                        ans = min(ans, getRectangleArea(pointsArr[i], pointsArr[j], pointsArr[k]))
                    }
                }
            }
        }
        return ans == doubleMax ? 0.0 : ans
    }
    

    private func getRectangleArea(_ first: Point,_ second:Point, _ third: Point) -> Double {        
        let v1 = Vector(from: first, to: second)
        let v2 = Vector(from: first, to: third)
        let v3 = Vector(from: second, to: third)
        var  parameters: Parameters = (nil, nil, nil, nil)

        if v1.isVertical(with: v2) {
            if v3.squreDistance > v1.squreDistance && v3.squreDistance > v2.squreDistance { parameters = (v1, v2, v3, first) }
        }
        if  v1.isVertical(with: v3) {
            if v2.squreDistance > v1.squreDistance && v2.squreDistance > v3.squreDistance {
                parameters = (Vector(from: second, to: first),v3,v2,second)
            }
        }
        if v2.isVertical(with: v3) {
            if v1.squreDistance > v2.squreDistance && v1.squreDistance > v3.squreDistance {
                parameters = (Vector(from: third, to: first),Vector(from: third, to: second), v1, third)
            }
        }

        guard parameters.first != nil else { return doubleMax }
        let ans = area(parameters: parameters)
        guard let forth = ans.point else { return doubleMax }
        calculateRectangles.insert([first, second, third])
        calculateRectangles.insert([first, second, forth])
        calculateRectangles.insert([third, second, forth])
        calculateRectangles.insert([first, third, forth])
        return ans.area
    }
    

    private func area(parameters: Parameters) -> ResultType {
        guard let v1 = parameters.first, let v2 =  parameters.second,
              let _ = parameters.third, let commonPoint = parameters.commonPoint else { return (doubleMax, nil) }
        let forthVec = v1.add(other: v2)
        let forthPoint = forthVec.getToPoint(from: commonPoint)
        guard pointsSet.contains(forthPoint) else { return (doubleMax,nil) }
        return (sqrt(Double(v1.squreDistance * v2.squreDistance)), forthPoint)
    }

}