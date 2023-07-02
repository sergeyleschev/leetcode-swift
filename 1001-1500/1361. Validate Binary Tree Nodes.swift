class Solution {

    // Solution by Sergey Leschev

    // 1361. Validate Binary Tree Nodes
    // You have n binary tree nodes numbered from 0 to n - 1 where node i has two children leftChild[i] and rightChild[i], return true if and only if all the given nodes form exactly one valid binary tree.
    // If node i has no left child then leftChild[i] will equal -1, similarly for the right child.
    // Note that the nodes have no values and that we only use the node numbers in this problem.

    // Example 1:
    // Input: n = 4, leftChild = [1,-1,3,-1], rightChild = [2,-1,-1,-1]
    // Output: true

    // Example 2:
    // Input: n = 4, leftChild = [1,-1,3,-1], rightChild = [2,3,-1,-1]
    // Output: false

    // Example 3:
    // Input: n = 2, leftChild = [1,0], rightChild = [-1,-1]
    // Output: false

    // Example 4:
    // Input: n = 6, leftChild = [1,-1,-1,4,-1,-1], rightChild = [2,-1,-1,5,-1,-1]
    // Output: false

    // Constraints:
    // 1 <= n <= 10^4
    // leftChild.length == rightChild.length == n
    // -1 <= leftChild[i], rightChild[i] <= n - 1

    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var count = 0
        var root = -1
        var degrees = [Int](repeating: 0, count: n)
        var visited = [Bool](repeating: false, count: n)

        for i in 0..<n {
            if leftChild[i] != -1 { degrees[leftChild[i]] += 1 }
            if rightChild[i] != -1 { degrees[rightChild[i]] += 1 }
        }

        for i in 0..<n {
            guard degrees[i] <= 1 else { return false }
            if degrees[i] == 0 {
                count += 1
                root = i
                guard count <= 1 else { return false }
            }
        }

        guard root != -1 else { return false }

        // DFS
        func dfs(_ node: Int) -> Bool {
            guard !visited[node] else { return false }
            visited[node] = true
            if leftChild[node] != -1 {
                guard dfs(leftChild[node]) else { return false }
            }
            if rightChild[node] != -1 {
                guard dfs(rightChild[node]) else { return false }
            }
            return true
        }

        guard dfs(root) else { return false }
        return !visited.contains(false)
    }

}
