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

    // 513. Find Bottom Left Tree Value
    // Given the root of a binary tree, return the leftmost value in the last row of the tree.

    // Example 1:
    // Input: root = [2,1,3]
    // Output: 1

    // Example 2:
    // Input: root = [1,2,3,4,null,5,6,null,null,7]
    // Output: 7

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -2^31 <= Node.val <= 2^31 - 1

    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var res:(depth: Int, value: Int) = (0, 0)
        return findOperation(root, depth: 1, res: &res)
    }
    
    
    func findOperation(_ root: TreeNode?, depth: Int, res: inout (depth: Int, value: Int)) -> Int{
        if res.depth < depth {
            res.value = (root?.val)!
            res.depth = depth
        }
        
        if root?.left != nil { let _ = findOperation(root?.left, depth: depth + 1, res: &res) }
        if root?.right != nil { let _ = findOperation(root?.right, depth: depth + 1, res: &res) }
        return res.value
    }

}