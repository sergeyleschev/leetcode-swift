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

    // 106. Construct Binary Tree from Inorder and Postorder Traversal
    // Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

    // Example 1:
    // Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
    // Output: [3,9,20,null,null,15,7]

    // Example 2:
    // Input: inorder = [-1], postorder = [-1]
    // Output: [-1]

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard postorder.count > 0 else { return nil }
        
        let totalCount = postorder.count
        let root = TreeNode(postorder[totalCount - 1])
        var rootIndex = -1
        
        for (i, val) in inorder.enumerated() {
            if val == root.val {
                rootIndex = i
                break
            } 
        }
        
        let leftCount = rootIndex
        let rightCount = totalCount - leftCount - 1
        
        root.left = buildTree(Array(inorder[0..<leftCount]), Array(postorder[0..<leftCount]))
        root.right = buildTree(Array(inorder[1 + leftCount..<totalCount]), Array(postorder[leftCount..<totalCount - 1]))
        return root
    }
    
}