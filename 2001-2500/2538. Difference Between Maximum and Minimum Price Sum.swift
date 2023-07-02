class Solution {

    // Solution by Sergey Leschev
    // 2538. Difference Between Maximum and Minimum Price Sum

    var subtreeSum = [Int]()
    var maxDifference = 0

    func maxOutput(_ n: Int, _ edges: [[Int]], _ price: [Int]) -> Int {
        var tree = [[Int]](repeating: [Int](), count: n)

        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }

        subtreeSum = [Int](repeating: 0, count: n)
        dfs(0, -1, tree, price)
        dfs2(0, -1, tree, price, 0)

        return maxDifference
    }

    func dfs(_ node: Int, _ parent: Int, _ tree: [[Int]], _ price: [Int]) -> Int {
        var maxChildSum = 0

        for child in tree[node] {
            if child == parent {
                continue
            }

            maxChildSum = max(maxChildSum, dfs(child, node, tree, price))
        }

        subtreeSum[node] = price[node] + maxChildSum
        return subtreeSum[node]
    }

    func dfs2(
        _ node: Int, _ parent: Int, _ tree: [[Int]], _ price: [Int], _ parentContribution: Int
    ) {
        var maxChild1 = -1
        var maxChild2 = -1
        var maxChildSum1 = 0
        var maxChildSum2 = 0

        for child in tree[node] {
            if child == parent {
                continue
            }

            let childSum = subtreeSum[child]

            if childSum > maxChildSum1 {
                maxChildSum2 = maxChildSum1
                maxChild2 = maxChild1
                maxChildSum1 = childSum
                maxChild1 = child
            } else if childSum > maxChildSum2 {
                maxChildSum2 = childSum
                maxChild2 = child
            }
        }

        let path1 = maxChildSum1
        let path2 = parentContribution

        maxDifference = max(maxDifference, max(path1, path2))

        for child in tree[node] {
            if child == parent {
                continue
            }

            if child == maxChild1 {
                dfs2(child, node, tree, price, price[node] + max(maxChildSum2, parentContribution))
            } else {
                dfs2(child, node, tree, price, price[node] + max(maxChildSum1, parentContribution))
            }
        }
    }
}
