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

    // 606. Construct String from Binary Tree
    // Given the root of a binary tree, construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way, and return it.
    // Omit all the empty parenthesis pairs that do not affect the one-to-one mapping relationship between the string and the original binary tree.

    // Example 1:
    // Input: root = [1,2,3,4]
    // Output: "1(2(4))(3)"
    // Explanation: Originallay it needs to be "1(2(4)())(3()())", but you need to omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"

    // Example 2:
    // Input: root = [1,2,3,null,4]
    // Output: "1(2()(4))(3)"
    // Explanation: Almost the same as the first example, except we cannot omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -1000 <= Node.val <= 1000

    func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else { return "" }
        
        if t.left == nil && t.right == nil {
            return String(t.val)
        } else if t.left != nil && t.right == nil {
            return String(t.val) + "(" + self.tree2str(_: t.left) + ")"
        } else if t.left == nil && t.right != nil {
            return String(t.val) + "()" + "(" + self.tree2str(_: t.right) + ")"
        } else {
            return String(t.val) + "(" + self.tree2str(_: t.left) + ")" + "(" + self.tree2str(_: t.right) + ")"
        }    
    
    }

}