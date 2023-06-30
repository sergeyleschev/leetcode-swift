class Solution {

    // Solution by Sergey Leschev

    // 1335. Minimum Difficulty of a Job Schedule
    // You want to schedule a list of jobs in d days. Jobs are dependent (i.e To work on the i-th job, you have to finish all the jobs j where 0 <= j < i).
    // You have to finish at least one task every day. The difficulty of a job schedule is the sum of difficulties of each day of the d days. The difficulty of a day is the maximum difficulty of a job done in that day.
    // Given an array of integers jobDifficulty and an integer d. The difficulty of the i-th job is jobDifficulty[i].
    // Return the minimum difficulty of a job schedule. If you cannot find a schedule for the jobs return -1.

    // Example 1:
    // Input: jobDifficulty = [6,5,4,3,2,1], d = 2
    // Output: 7
    // Explanation: First day you can finish the first 5 jobs, total difficulty = 6.
    // Second day you can finish the last job, total difficulty = 1.
    // The difficulty of the schedule = 6 + 1 = 7 

    // Example 2:
    // Input: jobDifficulty = [9,9,9], d = 4
    // Output: -1
    // Explanation: If you finish a job per day you will still have a free day. you cannot find a schedule for the given jobs.

    // Example 3:
    // Input: jobDifficulty = [1,1,1], d = 3
    // Output: 3
    // Explanation: The schedule is one job per day. total difficulty will be 3.

    // Example 4:
    // Input: jobDifficulty = [7,1,7,1,7,1], d = 3
    // Output: 15

    // Example 5:
    // Input: jobDifficulty = [11,111,22,222,33,333,44,444], d = 6
    // Output: 843

    // Constraints:
    // 1 <= jobDifficulty.length <= 300
    // 0 <= jobDifficulty[i] <= 1000
    // 1 <= d <= 10

    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        if d == 1 { return jobDifficulty.max() ?? -1 }
        let jobs = jobDifficulty.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: jobs), count: d)

        for i in stride(from: d - 1, through: 0, by: -1) {
            let lastJob = jobDifficulty.count - (d - i)

            for j in stride(from: lastJob, through: i, by: -1) {
                if i == d - 1 {
                    dp[i][j] = jobDifficulty[j ... lastJob].max()!
                } else {
                    var difficulty = Int.min
                    dp[i][j] = Int.max

                    let firstJob = i == 0 ? 0 : j
                    let lastJob = i == 0 ? j : lastJob
                    for k in firstJob ... lastJob {
                        difficulty = max(difficulty, jobDifficulty[k])
                        dp[i][j] = min(dp[i][j], difficulty + dp[i + 1][k + 1])
                    }
                }
            }
        }

        if let min = dp[0].filter({ $0 > 0 }).min() { return min }
        return -1
    }

}