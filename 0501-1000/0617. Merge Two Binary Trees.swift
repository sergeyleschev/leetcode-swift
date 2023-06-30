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

    // 617. Merge Two Binary Trees
    // You are given two binary trees root1 and root2.
    // Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.
    // Return the merged tree.
    // Note: The merging process must start from the root nodes of both trees.

    // Example 1:
    // Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
    // Output: [3,4,5,5,4,null,7]

    // Example 2:
    // Input: root1 = [1], root2 = [1,2]
    // Output: [2,2]

    // Constraints:
    // The number of nodes in both trees is in the range [0, 2000].
    // -10^4 <= Node.val <= 10^4

    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil && t2 == nil { return nil }
        if t1 == nil && t2 != nil { return t2 }
        if t1 != nil && t2 == nil { return t1 }
        
        if t1 != nil && t2 != nil {
            t1?.val = (t1?.val)! + (t2?.val)!
            t1?.left = self.mergeTrees(t1?.left, t2?.left)
            t1?.right = self.mergeTrees(t1?.right, t2?.right)
        }
        
        return t1
    }
    
}