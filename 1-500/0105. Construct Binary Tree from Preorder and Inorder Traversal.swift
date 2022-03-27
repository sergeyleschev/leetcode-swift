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

    // Solution @ Sergey Leschev, Belarusian State University

    // 105. Construct Binary Tree from Preorder and Inorder Traversal
    // Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

    // Example 1:
    // Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
    // Output: [3,9,20,null,null,15,7]

    // Example 2:
    // Input: preorder = [-1], inorder = [-1]
    // Output: [-1]
     
    // Constraints:
    // 1 <= preorder.length <= 3000
    // inorder.length == preorder.length
    // -3000 <= preorder[i], inorder[i] <= 3000
    // preorder and inorder consist of unique values.
    // Each value of inorder also appears in preorder.
    // preorder is guaranteed to be the preorder traversal of the tree.
    // inorder is guaranteed to be the inorder traversal of the tree.

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }
        
        let totalСount = preorder.count
        let root = TreeNode(preorder[0])
        var rootIndex = -1
        
        for (i, val) in inorder.enumerated() {
            if val == root.val {
                rootIndex = i
                break
            } 
        }
        
        let leftCount = rootIndex
        let rightCount = totalСount - leftCount - 1
        
        root.left = buildTree(Array(preorder[1..<1 + leftCount]), Array(inorder[0..<leftCount + 1]))
        root.right = buildTree(Array(preorder[1 + leftCount..<totalСount]), Array(inorder[1 + leftCount..<totalСount]))
        return root
    }
    
}