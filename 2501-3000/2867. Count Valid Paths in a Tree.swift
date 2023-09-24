class Solution {

    // Solution by Sergey Leschev
    // 2867. Count Valid Paths in a Tree

    // Time complexity: O(n)
    // Space complexity: O(n)

    func countPaths(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = 0
        var primes = Array(repeating: 1, count: n + 5)

        primes[1] = 0
        for i in 2...Int(sqrt(Double(n + 5))) {
            if primes[i] == 0 {
                continue
            }
            for j in stride(from: i * i, to: primes.count, by: i) {
                primes[j] = 0
            }
        }

        var adjList = Array(repeating: [Int](), count: n + 1)
        for edge in edges {
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }

        func dfs(_ curr: Int, _ parent: Int, _ adjList: [[Int]]) -> [Int] {
            var count = [0, 0]
            let isPrime = primes[curr] == 1

            for child in adjList[curr] {
                if child == parent {
                    continue
                }
                let next = dfs(child, curr, adjList)
                if isPrime {
                    // Path ends at curr
                    ans += next[0]
                    // curr is conduit for path
                    ans += count[1] * next[0]

                    count[1] += next[0]
                } else {
                    // Ends at curr
                    ans += next[1]
                    // curr is conduit for path
                    ans += count[0] * next[1]
                    ans += count[1] * next[0]

                    count[0] += next[0]
                    count[1] += next[1]
                }
            }

            count[isPrime ? 1 : 0] += 1
            return count
        }

        dfs(1, -1, adjList)
        return ans
    }
}
