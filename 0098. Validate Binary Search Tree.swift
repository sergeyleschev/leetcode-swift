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

    // 98. Validate Binary Search Tree
    // Given the root of a binary tree, determine if it is a valid binary search tree (BST).

    // A valid BST is defined as follows:
    // The left subtree of a node contains only nodes with keys less than the node's key.
    // The right subtree of a node contains only nodes with keys greater than the node's key.
    // Both the left and right subtrees must also be binary search trees.

    // Determines if a binary tree is a valid binary search tree.

    // - Parameter root: Binary tree root.
    // - Returns: True if the given tree is a valid binary search tree, otherwise
    //   returns false.
     
    // Example 1:
    // Input: root = [2,1,3]
    // Output: true

    // Example 2:
    // Input: root = [5,1,4,null,null,3,6]
    // Output: false
    // Explanation: The root node's value is 5 but its right child's value is 4.
     
    // Constraints:
    // The number of nodes in the tree is in the range [1, 104].
    // -2^31 <= Node.val <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.

    private var prev: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard inorder(root.left) else { return false }
        
        if let prev = prev, root.val <= prev { return false }
        
        prev = root.val
        return inorder(root.right)
    }

}