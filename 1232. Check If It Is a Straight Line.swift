class Solution {

    // 1232. Check If It Is a Straight Line
    // You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

    // Example 1:
    // Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
    // Output: true

    // Example 2:
    // Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
    // Output: false

    // Constraints:
    // 2 <= coordinates.length <= 1000
    // coordinates[i].length == 2
    // -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
    // coordinates contains no duplicate point.

    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count > 2 else { return true }
        let point1 = coordinates[0]
        let point2 = coordinates[1]
      
        for i in 2..<coordinates.count {
            let coordinate = coordinates[i]
            let qualify = (point1[1] - point2[1]) * (point1[0] - coordinate[0]) == (point1[0] - point2[0]) * (point1[1] - coordinate[1])
            if !qualify { return false }
        }
        
        return true
    }

}