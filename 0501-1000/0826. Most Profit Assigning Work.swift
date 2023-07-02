class Solution {

    // Solution by Sergey Leschev

    // 826. Most Profit Assigning Work
    // We have jobs: difficulty[i] is the difficulty of the ith job, and profit[i] is the profit of the ith job.
    // Now we have some workers. worker[i] is the ability of the ith worker, which means that this worker can only complete a job with difficulty at most worker[i].
    // Every worker can be assigned at most one job, but one job can be completed multiple times.
    // For example, if 3 people attempt the same job that pays $1, then the total profit will be $3.  If a worker cannot complete any job, his profit is $0.
    // What is the most profit we can make?

    // Example 1:
    // Input: difficulty = [2,4,6,8,10], profit = [10,20,30,40,50], worker = [4,5,6,7]
    // Output: 100
    // Explanation: Workers are assigned jobs of difficulty [4,4,6,6] and they get profit of [20,20,30,30] seperately.

    // Notes:
    // 1 <= difficulty.length = profit.length <= 10000
    // 1 <= worker.length <= 10000
    // difficulty[i], profit[i], worker[i]  are in range [1, 10^5]

    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        var maxProfit = 0
        var currentMaxProfit = 0
        var profitInfo = [Int: Int]()
        var i = 0
        var j = 0

        for i in 0..<difficulty.count {
            if let p = profitInfo[difficulty[i]] {
                profitInfo[difficulty[i]] = max(profit[i], p)
            } else {
                profitInfo[difficulty[i]] = profit[i]
            }

        }

        let difficulty = difficulty.sorted()
        let worker = worker.sorted()

        while i < worker.count && j < difficulty.count {
            if worker[i] >= difficulty[j] {
                if profitInfo[difficulty[j]]! > currentMaxProfit {
                    maxProfit += (worker.count - i) * profitInfo[difficulty[j]]!
                    maxProfit -= (worker.count - i) * currentMaxProfit
                    currentMaxProfit = profitInfo[difficulty[j]]!
                }
                j += 1
            } else {
                i += 1
            }
        }

        return maxProfit
    }

}
