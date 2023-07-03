class Solution {

    // Solution by Sergey Leschev
    // 2589. Minimum Time to Complete All Tasks

    func findMinimumTime(_ tasks: [[Int]]) -> Int {
        var bt = Array(repeating: 0, count: 2002)
        let n = 2001

        func prefixSum(_ i: Int) -> Int {
            var sum = 0
            var j = i + 1
            while j > 0 {
                sum += bt[j]
                j -= j & (-j)
            }
            return sum
        }

        func add(_ i: Int, _ val: Int) {
            var j = i + 1
            while j <= n {
                bt[j] += val
                j += j & (-j)
            }
        }

        var sortedTasks = tasks.sorted(by: { $0[1] < $1[1] })
        for task in sortedTasks {
            let start = task[0]
            let end = task[1]
            let duration = task[2]
            var d = duration - (prefixSum(end) - prefixSum(start - 1))
            var i = end
            while d > 0 {
                if prefixSum(i) == prefixSum(i - 1) {
                    add(i, 1)
                    d -= 1
                }
                i -= 1
            }
        }
        return prefixSum(n - 1)
    }
}
