class SummaryRanges {

    // Solution by Sergey Leschev

    // 352. Data Stream as Disjoint Intervals
    // Given a data stream input of non-negative integers a1, a2, ..., an, summarize the numbers seen so far as a list of disjoint intervals.
    // Implement the SummaryRanges class:
    // SummaryRanges() Initializes the object with an empty stream.
    // void addNum(int val) Adds the integer val to the stream.
    // int[][] getIntervals() Returns a summary of the integers in the stream currently as a list of disjoint intervals [starti, endi].

    // Example 1:
    // Input
    // ["SummaryRanges", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals"]
    // [[], [1], [], [3], [], [7], [], [2], [], [6], []]
    // Output
    // [null, null, [[1, 1]], null, [[1, 1], [3, 3]], null, [[1, 1], [3, 3], [7, 7]], null, [[1, 3], [7, 7]], null, [[1, 3], [6, 7]]]
    // Explanation
    // SummaryRanges summaryRanges = new SummaryRanges();
    // summaryRanges.addNum(1);      // arr = [1]
    // summaryRanges.getIntervals(); // return [[1, 1]]
    // summaryRanges.addNum(3);      // arr = [1, 3]
    // summaryRanges.getIntervals(); // return [[1, 1], [3, 3]]
    // summaryRanges.addNum(7);      // arr = [1, 3, 7]
    // summaryRanges.getIntervals(); // return [[1, 1], [3, 3], [7, 7]]
    // summaryRanges.addNum(2);      // arr = [1, 2, 3, 7]
    // summaryRanges.getIntervals(); // return [[1, 3], [7, 7]]
    // summaryRanges.addNum(6);      // arr = [1, 2, 3, 6, 7]
    // summaryRanges.getIntervals(); // return [[1, 3], [6, 7]]

    // Constraints:
    // 0 <= val <= 10^4
    // At most 3 * 10^4 calls will be made to addNum and getIntervals.

    // Follow up: What if there are lots of merges and the number of disjoint intervals is small compared to the size of the data stream?

    // - Complexity:
    //   - time: O(logn + n), where n current intervals length.
    //   - space: O(n)

    var intervals: [[Int]]

    /** Initialize your data structure here. */
    init() {
        intervals = [[Int]]()
    }

    func addNum(_ val: Int) {
        if intervals.isEmpty {
            intervals.append([val, val])
            return
        }

        var left = 0
        var right = intervals.count - 1

        while left < right {
            let mid = left + (right - left) / 2
            if intervals[mid][0] < val {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if intervals[left][0] == val { return }
        var cur = [val, val]

        var index = intervals[left][0] < val ? left : left - 1
        while index >= 0 {
            // merge left side
            if cur[0] <= intervals[index][1] + 1 {
                cur[1] = max(
                    intervals[index][1],
                    cur[1]
                )
                cur[0] = min(
                    intervals[index][0],
                    cur[0]
                )
                intervals.remove(at: index)
                index -= 1
            } else {
                break
            }
        }

        index += 1
        while index < intervals.count {
            if intervals[index][0] <= cur[1] + 1 {
                cur[1] = max(
                    intervals[index][1],
                    cur[1]
                )
                cur[0] = min(
                    intervals[index][0],
                    cur[0]
                )
                intervals.remove(at: index)
            } else {
                break
            }
        }

        if index == intervals.count {
            intervals.append(cur)
        } else if intervals[index][0] < cur[0] {
            intervals.insert(cur, at: index + 1)
        } else {
            intervals.insert(cur, at: index)
        }
    }

    func getIntervals() -> [[Int]] { intervals }

}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(val)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
