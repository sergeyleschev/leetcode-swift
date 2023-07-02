class Solution {

    // Solution by Sergey Leschev

    // 863. All Nodes Distance K in Binary Tree
    // We are given a binary tree (with root node root), a target node, and an integer value k.
    // Return a list of the values of all nodes that have a distance k from the target node.  The answer can be returned in any order.

    // Example 1:
    // Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
    // Output: [7,4,1]
    // Explanation:
    // The nodes that are a distance 2 from the target node (with value 5)
    // have values 7, 4, and 1.
    // Note that the inputs "root" and "target" are actually TreeNodes.
    // The descriptions of the inputs above are just serializations of these objects.

    // Note:
    // The given tree is non-empty.
    // Each node in the tree has unique values 0 <= node.val <= 500.
    // The target node is a node in the tree.
    // 0 <= k <= 1000.

    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
        var K = K
        var graph = [Int: [Int]]()
        var result = [Int]()
        var seen = Set<Int>()

        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }

            if let left = root.left {
                if let _ = graph[root.val] {
                    graph[root.val]?.append(left.val)
                } else {
                    var temp = [Int]()
                    temp.append(left.val)
                    graph[root.val] = temp
                }

                if let _ = graph[left.val] {
                    graph[left.val]?.append(root.val)
                } else {
                    var temp = [Int]()
                    temp.append(root.val)
                    graph[left.val] = temp
                }

                dfs(left)
            }

            if let right = root.right {
                if let _ = graph[root.val] {
                    graph[root.val]?.append(right.val)
                } else {
                    var temp = [Int]()
                    temp.append(right.val)
                    graph[root.val] = temp
                }

                if let _ = graph[right.val] {
                    graph[right.val]?.append(root.val)
                } else {
                    var temp = [Int]()
                    temp.append(root.val)
                    graph[right.val] = temp
                }

                dfs(right)
            }
        }

        dfs(root)

        result.append(target!.val)
        seen.insert(target!.val)

        // BFS
        while K > 0 {
            var NextTime = [Int]()
            while !result.isEmpty {
                if let tmp = result.popLast() {
                    if let graphArray = graph[tmp] {
                        for value in graphArray {
                            if !seen.contains(value) {
                                seen.insert(value)
                                NextTime.append(value)
                            }
                        }
                    }
                }
            }

            K -= 1
            result = NextTime
        }

        return result
    }

}
