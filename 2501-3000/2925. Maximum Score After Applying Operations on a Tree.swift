class Solution {

    // Solution by Sergey Leschev
    // 2925. Maximum Score After Applying Operations on a Tree

    func maximumScoreAfterOperations(_ edges: [[Int]], _ values: [Int]) -> Int {
        typealias Pair = (taken: Int, leftout: Int)

        func dfs(_ tree: [[Int]], _ values: [Int], _ node: Int, _ parent: Int) -> Pair {
            var leftout = 0
            var taken = 0

            for c in tree[node] {
                if c == parent { continue }
                let result = dfs(tree, values, c, node)
                taken += result.taken
                leftout += result.leftout
            }

            taken += (leftout != 0) ? max(leftout, values[node]) : 0
            leftout = (leftout != 0) ? min(leftout, values[node]) : values[node]

            return (taken, leftout)
        }

        var tree = [[Int]](repeating: [Int](), count: values.count)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }

        return dfs(tree, values, 0, -1).taken
    }
}
