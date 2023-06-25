class Solution {

    // Solution @ Sergey Leschev
    
    // 391. Perfect Rectangle
    // Given an array rectangles where rectangles[i] = [xi, yi, ai, bi] represents an axis-aligned rectangle. The bottom-left point of the rectangle is (xi, yi) and the top-right point of it is (ai, bi).
    // Return true if all the rectangles together form an exact cover of a rectangular region.

    // Example 1:
    // Input: rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
    // Output: true
    // Explanation: All 5 rectangles together form an exact cover of a rectangular region.

    // Example 2:
    // Input: rectangles = [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]
    // Output: false
    // Explanation: Because there is a gap between the two rectangular regions.

    // Example 3:
    // Input: rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]
    // Output: false
    // Explanation: Because there is a gap in the top center.

    // Example 4:
    // Input: rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]
    // Output: false
    // Explanation: Because two of the rectangles overlap with each other.

    // Constraints:
    // 1 <= rectangles.length <= 2 * 10^4
    // rectangles[i].length == 4
    // -10^5 <= xi, yi, ai, bi <= 10^5

    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ xx: Int, _ yy: Int) {
            self.x = xx
            self.y = yy
        }
        
        var hashValue: Int {
            return self.x ^ self.y
        }
        
        static func == (lhs: Point, rhs: Point) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }

    
    struct Rectangle {
        private let x1: Int
        private let y1: Int
        private let x2: Int
        private let y2: Int
        

        var p1: Point { Point(x1, y1) }
        var p2: Point { Point(x1, y2) }
        var p3: Point { Point(x2, y1) }
        var p4: Point { Point(x2, y2) }
        var area: Int { (self.y2 - self.y1) * (self.x2 - self.x1) }
        var minx: Int { self.x1 }
        var miny: Int { self.y1 }
        var maxx: Int { self.x2 }
        var maxy: Int { self.y2 }
        

        init(x1: Int, y1: Int, x2: Int, y2: Int) {
            self.x1 = x1
            self.y1 = y1
            self.x2 = x2
            self.y2 = y2
        }
    }

    
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        let rectList = rectangles.map {Rectangle(x1: $0[0], y1: $0[1], x2: $0[2], y2: $0[3])}
        var minx = Int.max
        var miny = Int.max
        var maxx = Int.min
        var maxy = Int.min
        var area = 0
        var set = Set<Point>()
        for rect in rectList {
            if set.insert(rect.p1).0 == false { set.remove(rect.p1) }
            if set.insert(rect.p2).0 == false { set.remove(rect.p2) }
            if set.insert(rect.p3).0 == false { set.remove(rect.p3) }
            if set.insert(rect.p4).0 == false { set.remove(rect.p4) }
            minx = min(minx, rect.minx)
            miny = min(miny, rect.miny)
            maxx = max(maxx, rect.maxx)
            maxy = max(maxy, rect.maxy)
            area += rect.area
        }
        let mRect = Rectangle(x1: minx, y1: miny, x2: maxx, y2: maxy)
        if set.count != 4 || !set.contains(mRect.p1) || !set.contains(mRect.p2) || !set.contains(mRect.p3) || !set.contains(mRect.p4) { return false }
        return mRect.area == area
    }
    
}