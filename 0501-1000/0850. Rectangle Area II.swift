class Solution {

    // Solution by Sergey Leschev

    // 850. Rectangle Area II
    // We are given a list of (axis-aligned) rectangles. Each rectangle[i] = [xi1, yi1, xi2, yi2] , where (xi1, yi1) are the coordinates of the bottom-left corner, and (xi2, yi2) are the coordinates of the top-right corner of the ith rectangle.
    // Find the total area covered by all rectangles in the plane. Since the answer may be too large, return it modulo 109 + 7.

    // Example 1:
    // Input: rectangles = [[0,0,2,2],[1,0,2,3],[1,0,3,1]]
    // Output: 6
    // Explanation: As illustrated in the picture.

    // Example 2:
    // Input: rectangles = [[0,0,1000000000,1000000000]]
    // Output: 49
    // Explanation: The answer is 1018 modulo (109 + 7), which is (109)2 = (-7)2 = 49.

    // Constraints:
    // 1 <= rectangles.length <= 200
    // rectanges[i].length = 4
    // 0 <= rectangles[i][j] <= 10^9
    // The total area covered by all rectangles will never exceed 2^63 - 1 and thus will fit in a 64-bit signed integer.

    // - Complexity:
    //   - time: O(N^3), where NN is the number of rectangles.
    //   - space: O(N^2)

    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        let n = rectangles.count
        var Xvals = Set<Int>()
        var Yvals = Set<Int>()
        var mapx = [Int: Int]()
        var mapy = [Int: Int]()
        let mod: Int = 1_000_000_007
        var area = 0
        
        for rec in rectangles {
            Xvals.insert(rec[0])
            Xvals.insert(rec[2])
            Yvals.insert(rec[1])
            Yvals.insert(rec[3])
        }
        
        var imapx = Xvals.sorted()
        var imapy = Yvals.sorted()
        
        for i in 0..<imapx.count { mapx[imapx[i]] = i }
        for i in 0..<imapy.count { mapy[imapy[i]] = i }
        
        var grid = Array(repeating: Array(repeating: false, count: imapy.count), count: imapx.count)
        for rec in rectangles {
            for x in mapx[rec[0]]!..<mapx[rec[2]]! {
                for y in mapy[rec[1]]!..<mapy[rec[3]]! {
                    grid[x][y] = true
                }
            }
        }
        
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                if grid[x][y] {
                    area += ((imapx[x + 1] - imapx[x]) * (imapy[y + 1] - imapy[y])) % mod
                }
            }
        }
        
        return area % mod
    }

}