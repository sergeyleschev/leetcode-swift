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

    // 94. Binary Tree Inorder Traversal
    // Given the root of a binary tree, return the inorder traversal of its nodes' values.

    // Binary tree inorder traversal.

    // - Parameter root: Binary tree root.
    // - Returns: Inorder traversal.

    // Example 1:
    // Input: root = [1,null,2,3]
    // Output: [1,3,2]

    // Example 2:
    // Input: root = []
    // Output: []
    // Example 3:

    // Input: root = [1]
    // Output: [1]

    // Example 4:
    // Input: root = [1,2]
    // Output: [2,1]

    // Example 5:
    // Input: root = [1,null,2]
    // Output: [1,2]
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 100].
    // -100 <= Node.val <= 100
     
    // Follow up: Recursive solution is trivial, could you do it iteratively?

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        var stack = [TreeNode?]()
        var curr = root

        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            if let val = curr?.val {
                ans.append(val)
            }
            curr = curr?.right
        }

        return ans
    }

    /*
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        
        func inorder(_ node: TreeNode?) {
            if node == nil { return } 
            
            inorder(node!.left)
            res.append(node!.val)
            inorder(node!.right)
        }
        
        inorder(root)
        return res
    }
    */

}