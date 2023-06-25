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

    // 101. Symmetric Tree
    // Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

    // Finds if a binary tree is a mirror of himself.

    // - Parameter root: Binary tree root.
    // - Returns: True if a binary tree is a mirror, otherwise returns false.

    // Example 1:
    // Input: root = [1,2,2,3,4,4,3]
    // Output: true

    // Example 2:
    // Input: root = [1,2,2,null,3,null,3]
    // Output: false

    // Constraints:
    // The number of nodes in the tree is in the range [1, 1000].
    // -100 <= Node.val <= 100
     
    // Follow up: Could you solve it both recursively and iteratively?

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        isMirror(root, root)
    }
    
    
    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil { return true }
        
        guard left?.val == right?.val else { return false }
        
        return isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }

}