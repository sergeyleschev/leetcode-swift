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

    // 222. Count Complete Tree Nodes
    // Given the root of a complete binary tree, return the number of the nodes in the tree.
    // According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
    // Design an algorithm that runs in less than O(n) time complexity.

    // Counts the number of nodes in a complete binary tree.
    // - Parameter root: The complete binary tree.
    // - Returns: Number of nodes.

    // Example 1:
    // Input: root = [1,2,3,4,5,6]
    // Output: 6

    // Example 2:
    // Input: root = []
    // Output: 0

    // Example 3:
    // Input: root = [1]
    // Output: 1

    // Constraints:
    // The number of nodes in the tree is in the range [0, 5 * 10^4].
    // 0 <= Node.val <= 5 * 10^4
    // The tree is guaranteed to be complete.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.

    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return countNodes(root.left) + countNodes(root.right) + 1
    }

}