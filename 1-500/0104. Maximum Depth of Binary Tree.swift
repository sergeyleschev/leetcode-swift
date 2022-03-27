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

    // Solution @ Sergey Leschev, Belarusian State University

    // 104. Maximum Depth of Binary Tree
    // Given the root of a binary tree, return its maximum depth.
    // A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

    // Finds the maximum depth in a binary tree.

    // - Parameter root: The binary tree.
    // - Returns: The maximum depth.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: 3

    // Example 2:
    // Input: root = [1,null,2]
    // Output: 2

    // Example 3:
    // Input: root = []
    // Output: 0

    // Example 4:
    // Input: root = [0]
    // Output: 1

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // -100 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.

    func maxDepth(_ root: TreeNode?) -> Int {
        root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }

}