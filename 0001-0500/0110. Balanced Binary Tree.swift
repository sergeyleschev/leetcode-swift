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

    // Solution by Sergey Leschev

    // 110. Balanced Binary Tree
    // Given a binary tree, determine if it is height-balanced.
    // For this problem, a height-balanced binary tree is defined as:
    // a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

    // Finds if a binary tree is height-balanced.

    // - Parameter root: Binary tree root.
    // - Returns: True if the binary tree is height-balanced, otherwise returns false.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: true

    // Example 2:
    // Input: root = [1,2,2,3,3,null,null,4,4]
    // Output: false

    // Example 3:
    // Input: root = []
    // Output: true
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 5000].
    // -10^4 <= Node.val <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        isBalancedTree(root).balanced
    }
    
    
    private func isBalancedTree(_ node: TreeNode?) -> (height: Int, balanced: Bool) {
        guard let node = node else { return (-1, true) }
        
        let left = isBalancedTree(node.left)
        guard left.balanced else { return(-1, false) }
        
        let right = isBalancedTree(node.right)
        guard right.balanced else { return (-1, false) }
        
        guard abs(left.height - right.height) < 2 else { return (-1, false) }
        
        return (max(left.height, right.height) + 1, true)
    }

}