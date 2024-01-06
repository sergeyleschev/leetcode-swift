class Solution {

    // Solution by Sergey Leschev
    // 2924. Find Champion II

    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = -1
        var count = 0
        var indegree = Array(repeating: 0, count: n)

        for e in edges {
            indegree[e[1]] += 1
        }

        for i in 0..<n {
            if indegree[i] == 0 {
                count += 1
                ans = i
            }
        }

        return count > 1 ? -1 : ans
    }
}
