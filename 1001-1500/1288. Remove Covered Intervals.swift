class Solution {

    // Solution @ Sergey Leschev

    // 1288. Remove Covered Intervals
    // Given a list of intervals, remove all intervals that are covered by another interval in the list.
    // Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.
    // After doing so, return the number of remaining intervals.

    // Calculates the number of intervals that are covered by another interval in the list.
    // - Parameter intervals: A list of intervals.
    // - Returns: The number of remaining intervals.

    // Example 1:
    // Input: intervals = [[1,4],[3,6],[2,8]]
    // Output: 2
    // Explanation: Interval [3,6] is covered by [2,8], therefore it is removed.

    // Example 2:
    // Input: intervals = [[1,4],[2,3]]
    // Output: 1

    // Example 3:
    // Input: intervals = [[0,10],[5,12]]
    // Output: 2

    // Example 4:
    // Input: intervals = [[3,10],[4,10],[5,11]]
    // Output: 2

    // Example 5:
    // Input: intervals = [[1,2],[1,4],[3,4]]
    // Output: 1

    // Constraints:
    // 1 <= intervals.length <= 1000
    // intervals[i].length == 2
    // 0 <= intervals[i][0] < intervals[i][1] <= 10^5
    // All the intervals are unique.

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of intervals.
    //   - space: O(n), where n is the number of intervals.
    
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted(by: { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] > $1[1] })
        var ans = 0
        var prevEnd = 0

        for interval in intervals {
            guard prevEnd < interval[1] else { continue }
            ans += 1
            prevEnd = interval[1]
        }

        return ans
    }

}