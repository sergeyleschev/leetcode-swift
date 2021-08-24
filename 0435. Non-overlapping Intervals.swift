class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 435. Non-overlapping Intervals
    // Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

    // Finds the minimum number of intervals for removal to make the rest of the intervals non-overlapping.

    // - Parameter intervals: The intervals.
    // - Returns: The minimum number of intervals for removal.

    // Example 1:
    // Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
    // Output: 1
    // Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.

    // Example 2:
    // Input: intervals = [[1,2],[1,2],[1,2]]
    // Output: 2
    // Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.

    // Example 3:
    // Input: intervals = [[1,2],[2,3]]
    // Output: 0
    // Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
     
    // Constraints:
    // 1 <= intervals.length <= 2 * 10^4
    // intervals[i].length == 2
    // -2 * 10^4 <= starti < endi <= 2 * 10^4

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of intervals.
    //   - space: O(n), where n is the number of intervals.
    
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else { return 0 }
        let intervals = intervals.sorted(by: { $0[1] != $1[1] ? $0[1] < $1[1] : $0[0] < $1[0] })

        var end = Int.min
        var ans = 0

        for interval in intervals {
            if interval[0] >= end {
                end = interval[1]
            } else {
                ans += 1
            }
        }

        return ans
    }

}