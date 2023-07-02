class Solution {

    // Solution by Sergey Leschev

    // 1235. Maximum Profit in Job Scheduling
    // We have n jobs, where every job is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i].
    // You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.
    // If you choose a job that ends at time X you will be able to start another job that starts at time X.

    // Example 1:
    // Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
    // Output: 120
    // Explanation: The subset chosen is the first and fourth job.
    // Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.

    // Example 2:
    // Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
    // Output: 150
    // Explanation: The subset chosen is the first, fourth and fifth job.
    // Profit obtained 150 = 20 + 70 + 60.

    // Example 3:
    // Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
    // Output: 6

    // Constraints:
    // 1 <= startTime.length == endTime.length == profit.length <= 5 * 10^4
    // 1 <= startTime[i] < endTime[i] <= 10^9
    // 1 <= profit[i] <= 10^4

    typealias Job = (range: Range<Int>, profit: Int)

    func binarySearch(in jobs: [Job], val: Int, _ left: Int, _ right: Int) -> Int {
        guard left <= right else { return left - 1 }
        let mid = (left + right) / 2

        if val < jobs[mid].range.upperBound {
            return binarySearch(in: jobs, val: val, left, right - 1)
        } else {
            return binarySearch(in: jobs, val: val, mid + 1, right)
        }
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let ranges: [Job] = startTime.indices.map { idx in
            (range: startTime[idx]..<endTime[idx], profit: profit[idx])
        }
        .sorted { $0.range.upperBound < $1.range.upperBound }
        var result = [Int](repeating: 0, count: ranges.count)

        result[0] = ranges.first!.profit
        for idx in 1..<ranges.count {
            let jdx = binarySearch(in: ranges, val: ranges[idx].range.lowerBound, 0, idx - 1)
            let val = result[safe: jdx] ?? 0
            result[idx] = max(val + ranges[idx].profit, result[idx - 1])
        }

        return result.last!
    }

}

extension Array {
    subscript(safe idx: Int) -> Element? { idx < 0 || idx >= self.count ? nil : self[idx] }
}
