class Solution {

    // Solution by Sergey Leschev

    // 223. Rectangle Area
    // Given the coordinates of two rectilinear rectangles in a 2D plane, return the total area covered by the two rectangles.
    // The first rectangle is defined by its bottom-left corner (ax1, ay1) and its top-right corner (ax2, ay2).
    // The second rectangle is defined by its bottom-left corner (bx1, by1) and its top-right corner (bx2, by2).

    // Example 1:
    // Rectangle Area
    // Input: ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
    // Output: 45

    // Example 2:
    // Input: ax1 = -2, ay1 = -2, ax2 = 2, ay2 = 2, bx1 = -2, by1 = -2, bx2 = 2, by2 = 2
    // Output: 16

    // Constraints:
    // -10^4 <= ax1, ay1, ax2, ay2, bx1, by1, bx2, by2 <= 10^4

    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int)
        -> Int
    {
        let areaA = computeArea(A, B, C, D)
        let areaB = computeArea(E, F, G, H)
        let areaIntersect = computeIntersectArea(A, B, C, D, E, F, G, H)

        return areaA + areaB - areaIntersect
    }

    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int) -> Int {
        abs((C - A) * (D - B))
    }

    func computeIntersectArea(
        _ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int
    ) -> Int {
        let x = [A, C, E, G].sorted()
        let y = [B, D, F, H].sorted()
        let intersectX = (x[3] - x[0]) < (abs(C - A) + abs(G - E))
        let intersectY = (y[3] - y[0]) < (abs(D - B) + abs(H - F))

        if intersectX && intersectY { return computeArea(x[1], y[1], x[2], y[2]) } else { return 0 }
    }

}
