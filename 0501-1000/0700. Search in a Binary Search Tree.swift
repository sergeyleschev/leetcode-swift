/// Definition for a binary tree node.
/// public class TreeNode {
///     public var val: Int
///     public var left: TreeNode?
///     public var right: TreeNode?
///     public init() { self.val = 0; self.left = nil; self.right = nil; }
///     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
///     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
///         self.val = val
///         self.left = left
///         self.right = right
///     }
/// }
class Solution {

    // Solution by Sergey Leschev

    // 700. Search in a Binary Search Tree
    // You are given the root of a binary search tree (BST) and an integer val.
    // Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

    // Finds the node in the BST that the node's value equals the given value.

    // - Parameters:
    //   - root: The root node of a binary search tree (BST).
    //   - val: The value to search.
    // - Returns: The subtree rooted with the node. If such node doesn't exist, returns nil.

    // Example 1:
    // Input: root = [4,2,7,1,3], val = 2
    // Output: [2,1,3]

    // Example 2:
    // Input: root = [4,2,7,1,3], val = 5
    // Output: []

    // Constraints:
    // The number of nodes in the tree is in the range [1, 5000].
    // 1 <= Node.val <= 10^7
    // root is a binary search tree.
    // 1 <= val <= 10^7

    // - Complexity:
    //   - time: O(log n), where n is the number of nodes.
    //   - space: O(1), only constant space is used.

    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        guard root.val != val else { return root }

        if root.val < val { return searchBST(root.right, val) }

        return searchBST(root.left, val)
    }

}
