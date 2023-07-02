class Solution {

    // Solution by Sergey Leschev

    // 1893. Check if All the Integers in a Range Are Covered
    // You are given a 2D integer array ranges and two integers left and right. Each ranges[i] = [start(i), end(i)] represents an inclusive interval between start(i) and end(i).
    // Return true if each integer in the inclusive range [left, right] is covered by at least one interval in ranges. Return false otherwise.
    // An integer x is covered by an interval ranges[i] = [start(i), end(i)] if start(i) <= x <= end(i).

    // Example 1:
    // Input: ranges = [[1,2],[3,4],[5,6]], left = 2, right = 5
    // Output: true
    // Explanation: Every integer between 2 and 5 is covered:
    // - 2 is covered by the first range.
    // - 3 and 4 are covered by the second range.
    // - 5 is covered by the third range.

    // Example 2:
    // Input: ranges = [[1,10],[10,20]], left = 21, right = 21
    // Output: false
    // Explanation: 21 is not covered by any range.

    // Constraints:
    // 1 <= ranges.length <= 50
    // 1 <= start(i) <= end(i) <= 50
    // 1 <= left <= right <= 50

    private var ranges = [[Int]]()

    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        self.ranges = ranges
        for num in left...right {
            guard isCovered(num) else { return false }
        }
        return true
    }

    private func isCovered(_ num: Int) -> Bool {
        for range in ranges where num >= range[0] && num <= range[1] { return true }
        return false
    }

}
