class Solution {

    // Solution @ Sergey Leschev

    // 452. Minimum Number of Arrows to Burst Balloons
    // There are some spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter, and hence the x-coordinates of start and end of the diameter suffice. The start is always smaller than the end.
    // An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps traveling up infinitely.
    // Given an array points where points[i] = [xstart, xend], return the minimum number of arrows that must be shot to burst all balloons.

    // Finds the minimum number of arrows that must be shot to burst all balloons.

    // - Parameter points: An array of balloons points.
    // - Returns: The minimum number of arrows.

    // Example 1:
    // Input: points = [[10,16],[2,8],[1,6],[7,12]]
    // Output: 2
    // Explanation: One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).

    // Example 2:
    // Input: points = [[1,2],[3,4],[5,6],[7,8]]
    // Output: 4

    // Example 3:
    // Input: points = [[1,2],[2,3],[3,4],[4,5]]
    // Output: 2

    // Constraints:

    // 1 <= points.length <= 10^4
    // points[i].length == 2
    // -2^31 <= xstart < xend <= 2^31 - 1

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of points.
    //   - space: O(n), where n is the number of points.
    
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        let points = points.sorted(by: { $0[1] < $1[1] })
        var ans = 1
        var end = points[0][1]

        for point in points {
            guard end < point[0] else { continue }
            ans += 1
            end = point[1]
        }

        return ans
    }

}