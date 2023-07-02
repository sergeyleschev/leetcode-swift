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

    // 897. Increasing Order Search Tree
    // Given the root of a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only one right child.

    // Rearranges the tree in in-order so that the leftmost node in the tree is now
    // the root of the tree, and every node has no left child and only one right child.

    // - Parameter root: Binary tree root.
    // - Returns: The new root of the binary tree.

    // Example 1:
    // Input: root = [5,3,6,2,4,null,8,1,null,null,null,7,9]
    // Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

    // Example 2:
    // Input: root = [5,1,7]
    // Output: [1,null,5,null,7]

    // Constraints:
    // The number of nodes in the given tree will be in the range [1, 100].
    // 0 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.

    private var cur = TreeNode(-1)

    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var ans = TreeNode(-1)
        cur = ans
        inorder(root)
        return ans.right
    }

    private func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        node.left = nil
        cur.right = node
        cur = node
        inorder(node.right)
    }

}
