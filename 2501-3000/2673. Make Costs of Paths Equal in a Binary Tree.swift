class Solution {

    // Solution by Sergey Leschev
    // 2673. Make Costs of Paths Equal in a Binary Tree
    // DFS
    // Time complexity: O(n)
    // Space complexity: O(h)

    var res: Int = 0

    func minIncrements(_ n: Int, _ cost: [Int]) -> Int {
        // Helper function to perform the depth-first search (DFS)
        func dfs(_ i: Int) -> Int {
            if i >= cost.count { return 0 }
            let a = dfs(2 * i + 1)
            let b = dfs(2 * i + 2)
            res += abs(a - b)
            return cost[i] + max(a, b)
        }

        dfs(0)
        return res
    }
}
