class Solution {

    // Solution by Sergey Leschev
    // 2836. Maximize Value of Function in a Ball Passing Game
    // Time complexity: O(n log ⁡k)
    // Space complexity: O(n log ⁡k)

    func getMaxFunctionValue(_ receiver: [Int], _ k: Int) -> Int {
        let n = receiver.count
        var parent = Array(repeating: Array(repeating: 0, count: 35), count: n)
        var pathSum = Array(repeating: Array(repeating: 0, count: 35), count: n)

        for start in 0..<n {
            parent[start][0] = receiver[start]
            pathSum[start][0] = receiver[start]
        }

        for power in 1..<35 {
            for start in 0..<n {
                parent[start][power] = parent[parent[start][power - 1]][power - 1]
                pathSum[start][power] =
                    pathSum[start][power - 1] + pathSum[parent[start][power - 1]][power - 1]
            }
        }

        var res = 0
        for start in 0..<n {
            var i = start
            var runningSum = 0
            var kCopy = k
            var power = 0

            while kCopy > 0 {
                if kCopy & 1 != 0 {
                    runningSum += pathSum[i][power]
                    i = parent[i][power]
                }
                kCopy >>= 1
                power += 1
            }

            res = max(start + runningSum, res)
        }

        return res
    }
}
