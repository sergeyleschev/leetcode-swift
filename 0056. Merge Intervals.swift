class Solution {

    // 56. Merge Intervals
    // Given an array of intervals where intervals[i] = [start i, end i], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

    // Merge all overlapping intervals.
    // - Parameter intervals: An array of `intervals`.
    // - Returns: An array of the non-overlapping intervals.

    // Example 1:
    // Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
    // Output: [[1,6],[8,10],[15,18]]
    // Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

    // Example 2:
    // Input: intervals = [[1,4],[4,5]]
    // Output: [[1,5]]
    // Explanation: Intervals [1,4] and [4,5] are considered overlapping.
     
    // Constraints:
    // 1 <= intervals.length <= 10^4
    // intervals[i].length == 2
    // 0 <= start i <= end i <= 10^4

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of intervals.
    //   - space: O(n), where n is the number of intervals.
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        var intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var ans = [[Int]]()
        var start = intervals[0][0]
        var end = intervals[0][1]
        
        for interval in intervals {
            guard end < interval[0] else {
                end = max(end, interval[1])
                continue
            }
            ans.append([start, end])
            start = interval[0]
            end = interval[1]
        }
        
        ans.append([start, end])
        return ans
    }

}