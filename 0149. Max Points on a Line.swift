class Solution {

	// 149. Max Points on a Line
	// Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

	// Example 1:
	// Input: points = [[1,1],[2,2],[3,3]]
	// Output: 3

	// Example 2:
	// Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
	// Output: 4

	// Constraints:
	// 1 <= points.length <= 300
	// points[i].length == 2
	// -10^4 <= xi, yi <= 10^4
	// All the points are unique.

	// - Complexity:
    //   - HashMap O(n ^ 2)

	func maxPoints(_ points: [[Int]]) -> Int {
		guard points.count > 2 else { return points.count }
		
        var map: [String: Set<Int>] = [:]
		var max = 0
		
        for i in 0..<points.count {
			if i + 1 >= points.count { break }
			
            for j in i+1..<points.count {
				let line = lineOfTwoPoint(i, j, points)
				let key = "\(line.0)-\(line.1)"
                var indexs = map[key] != nil ? map[key]! : Set<Int>()
                
                indexs.insert(i)
                indexs.insert(j)
                map[key] = indexs
				max = max > map[key]!.count ? max : map[key]!.count
			}
		}
        
		return max
	}

	// y = kx + a, idx0, idx1
	func lineOfTwoPoint(_ idx0: Int, _ idx1: Int, _ points: [[Int]]) -> (Double, Double) {
		let p0 = points[idx0]
		let p1 = points[idx1]
		var k, a: Double
		
        if p0[1] == p1[1] {
			k = 0
			a = Double(p0[1])
		
        } else if p0[0] == p1[0] {
			k = Double(Int.max)
			a = Double(p0[0])
		
        } else {
		
            k = Double(p0[1] - p1[1]) / Double(p0[0] - p1[0])
			a = Double(p0[1]) - k * Double(p0[0])
		}
        
		return (k, a)
	}

}