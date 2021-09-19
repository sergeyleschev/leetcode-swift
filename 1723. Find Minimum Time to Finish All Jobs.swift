class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1723. Find Minimum Time to Finish All Jobs
    // You are given an integer array jobs, where jobs[i] is the amount of time it takes to complete the ith job.
    // There are k workers that you can assign jobs to. Each job should be assigned to exactly one worker. The working time of a worker is the sum of the time it takes to complete all jobs assigned to them. Your goal is to devise an optimal assignment such that the maximum working time of any worker is minimized.

    // Return the minimum possible maximum working time of any assignment.

    // Example 1:
    // Input: jobs = [3,2,3], k = 3
    // Output: 3
    // Explanation: By assigning each person one job, the maximum time is 3.

    // Example 2:
    // Input: jobs = [1,2,4,7,8], k = 2
    // Output: 11
    // Explanation: Assign the jobs the following way:
    // Worker 1: 1, 2, 8 (working time = 1 + 2 + 8 = 11)
    // Worker 2: 4, 7 (working time = 4 + 7 = 11)
    // The maximum working time is 11.

    // Constraints:
    // 1 <= k <= jobs.length <= 12
    // 1 <= jobs[i] <= 10^7

    func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
        let num = jobs.count
        let jobArr = jobs.sorted(by: >)


        func helper(_ i: Int, _ arr: inout [Int], _ mid: Int) -> Bool {
            if i == num { return true }
            let job = jobArr[i]
            for j in 0..<k {
                if (arr[j] + job <= mid) {
                    arr[j] += job
                    if helper(i + 1, &arr, mid) { return true }
                    arr[j] -= job
                }
                if arr[j] == 0 || arr[j] + job == mid { break }
            }
            return false
        }
        
        func check(_ mid: Int) -> Bool {
            var arr = Array.init(repeating:0, count: k)
            return helper(0, &arr, mid)
        }
        
        var left = jobArr[0], right = jobArr.reduce(0) { x, y in x + y }
        while left < right {
            let mid = (left + right) >> 1
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

}