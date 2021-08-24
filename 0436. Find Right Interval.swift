class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 436. Find Right Interval
    // You are given an array of intervals, where intervals[i] = [starti, endi] and each starti is unique.
    // The right interval for an interval i is an interval j such that startj >= endi and startj is minimized.
    // Return an array of right interval indices for each interval i. If no right interval exists for interval i, then put -1 at index i.

    // Checks if there exists an interval j whose start point is bigger than or equal to the end point of the interval i.

    // - Parameter intervals: The intervals.
    // - Returns: An array of intervals indexes.

    // Example 1:
    // Input: intervals = [[1,2]]
    // Output: [-1]
    // Explanation: There is only one interval in the collection, so it outputs -1.

    // Example 2:
    // Input: intervals = [[3,4],[2,3],[1,2]]
    // Output: [-1,0,1]
    // Explanation: There is no right interval for [3,4].
    // The right interval for [2,3] is [3,4] since start0 = 3 is the smallest start that is >= end1 = 3.
    // The right interval for [1,2] is [2,3] since start1 = 2 is the smallest start that is >= end2 = 2.

    // Example 3:
    // Input: intervals = [[1,4],[2,3],[3,4]]
    // Output: [-1,2,-1]
    // Explanation: There is no right interval for [1,4] and [3,4].
    // The right interval for [2,3] is [3,4] since start2 = 3 is the smallest start that is >= end1 = 3.

    // Constraints:
    // 1 <= intervals.length <= 2 * 10^4
    // intervals[i].length == 2
    // -10^6 <= starti <= endi <= 10^6
    // The start point of each interval is unique.

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of intervals.
    //   - space: O(n), where n is the number of intervals.
    
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        guard !intervals.isEmpty else { return [] }
        guard intervals.count > 1 else { return [-1] }
        var dict = [Int: Int]()
        var sp = [Int]()
        var ans = [Int]()
        
        for (i, el) in intervals.enumerated() {
            dict[el[0]] = i
            sp.append(el[0])
        }
        sp.sort()

        for interval in intervals {
            var start = 0
            var end = intervals.count - 1
            var min = -1
            var found = false
            while start <= end {
                let mid = start + (end - start) / 2
                if sp[mid] >= interval[1] {
                    min = sp[mid]
                    end = mid - 1
                    found = true
                } else {
                    start = mid + 1
                }
            }

            ans.append(found ? (dict[min] ?? -1) : -1)
        }

        return ans
    }

}