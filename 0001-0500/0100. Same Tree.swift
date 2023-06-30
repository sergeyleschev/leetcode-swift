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

    // 100. Same Tree
    // Given the roots of two binary trees p and q, write a function to check if they are the same or not.
    // Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

    // Checks if two binary trees are the same.

    // - Parameters:
    //   - p: Binary tree root.
    //   - q: Binary tree root.
    // - Returns: True if p and q are the same, otherwise returns false.

    // Example 1:
    // Input: p = [1,2,3], q = [1,2,3]
    // Output: true

    // Example 2:
    // Input: p = [1,2], q = [1,null,2]
    // Output: false

    // Example 3:
    // Input: p = [1,2,1], q = [1,1,2]
    // Output: false
     
    // Constraints:
    // The number of nodes in both trees is in the range [0, 100].
    // -10^4 <= Node.val <= 10^4

    // - Complexity:
    //   - time: O(min(n, m)), where n is the number of nodes in p and m is the number of nodes in q.
    //   - space: O(min(n, m)), where n is the number of nodes in p and m is the number of nodes in q.
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil || q != nil else { return true }
        
        guard let p = p, let q = q else { return false }
        
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }

}