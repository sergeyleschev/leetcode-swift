class Solution {

    // Solution by Sergey Leschev
    // 2973. Find Number of Coins to Place in Tree Nodes

    var ans = [Int]()

    func dfs(_ t: [[Int]], _ cost: [Int], _ root: Int, _ par: Int) -> [Int] {
        var usefulCost = [cost[root]]
        for n in t[root] {
            if n == par {
                continue
            }
            let v = dfs(t, cost, n, root)
            usefulCost.append(contentsOf: v)
        }

        usefulCost.sort(by: >)
        let sz = usefulCost.count

        if usefulCost.count < 3 {
            ans[root] = 1
            return usefulCost
        }

        if usefulCost[1] * usefulCost[2] > usefulCost[sz - 1] * usefulCost[sz - 2] {
            ans[root] = usefulCost[0] * usefulCost[1] * usefulCost[2]
        } else {
            ans[root] = usefulCost[0] * usefulCost[sz - 1] * usefulCost[sz - 2]
        }

        if ans[root] < 0 {
            ans[root] = 0
        }

        if usefulCost.count <= 5 {
            return usefulCost
        }

        return [
            usefulCost[0], usefulCost[1], usefulCost[2], usefulCost[sz - 2], usefulCost[sz - 1],
        ]
    }

    func placedCoins(_ edges: [[Int]], _ cost: [Int]) -> [Int] {
        ans = Array(repeating: 0, count: cost.count)
        var t = [[Int]](repeating: [], count: cost.count)
        for e in edges {
            t[e[0]].append(e[1])
            t[e[1]].append(e[0])
        }
        _ = dfs(t, cost, 0, -1)
        return ans
    }
}
