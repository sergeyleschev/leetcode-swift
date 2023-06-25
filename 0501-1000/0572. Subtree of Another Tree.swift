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

    // 572. Subtree of Another Tree
    // Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.
    // A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

    // Example 1:
    // Input: root = [3,4,5,1,2], subRoot = [4,1,2]
    // Output: true

    // Example 2:
    // Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
    // Output: false

    // Constraints:
    // The number of nodes in the root tree is in the range [1, 2000].
    // The number of nodes in the subRoot tree is in the range [1, 1000].
    // -10^4 <= root.val <= 10^4
    // -10^4 <= subRoot.val <= 10^4

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true } 
        else if p == nil || q == nil { return false }
        
        if p?.val != q?.val { return false } 
        else { return self.isSameTree(p?.left, q?.left) && self.isSameTree(p?.right, q?.right) }    
    }

    
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        var res = false

        if s != nil && t != nil {
            if s?.val == t?.val{ res = isSameTree(s, t) }
            if !res { res = isSubtree(s?.left, t) }
            if !res { res = isSubtree(s?.right, t) }
        }

        return res
    }

}