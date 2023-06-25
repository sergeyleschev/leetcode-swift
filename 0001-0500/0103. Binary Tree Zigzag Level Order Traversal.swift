/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {

    // Solution @ Sergey Leschev

    // 103. Binary Tree Zigzag Level Order Traversal
    // Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

    // Returns the zigzag level order traversal of binary tree nodes' values.

    // - Parameter root: Binary tree root.
    // - Returns: The zigzag level order traversal.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: [[3],[20,9],[15,7]]

    // Example 2:
    // Input: root = [1]
    // Output: [[1]]

    // Example 3:
    // Input: root = []
    // Output: []
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 2000].
    // -100 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        dfs(root, level: 0, ans: &ans)
        return ans
    }


    private func dfs(_ node: TreeNode?, level: Int, ans: inout [[Int]]) {
        guard let node = node else { return }
        if ans.count <= level { ans.append([Int]()) }

        if level % 2 == 0 {
            ans[level].append(node.val)
        } else {
            ans[level].insert(node.val, at: 0)
        }

        dfs(node.left, level: level + 1, ans: &ans)
        dfs(node.right, level: level + 1, ans: &ans)
    }

}