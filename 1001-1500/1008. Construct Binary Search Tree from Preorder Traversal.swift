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

    // 1008. Construct Binary Search Tree from Preorder Traversal
    // Given an array of integers preorder, which represents the preorder traversal of a BST (i.e., binary search tree), construct the tree and return its root.
    // It is guaranteed that there is always possible to find a binary search tree with the given requirements for the given test cases.
    // A binary search tree is a binary tree where for every node, any descendant of Node.left has a value strictly less than Node.val, and any descendant of Node.right has a value strictly greater than Node.val.
    // A preorder traversal of a binary tree displays the value of the node first, then traverses Node.left, then traverses Node.right.

    // Example 1:
    // Input: preorder = [8,5,1,7,10,12]
    // Output: [8,5,10,1,7,null,12]

    // Example 2:
    // Input: preorder = [1,3]
    // Output: [1,null,3]

    // Constraints:
    // 1 <= preorder.length <= 100
    // 1 <= preorder[i] <= 10^8
    // All the values of preorder are unique.

    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard preorder.count >= 1 else { return nil }
        let root = TreeNode(preorder[0])
        var stack = [root]
        
        for i in 1..<preorder.count {
            var temp = stack.last!
            while !stack.isEmpty && stack.last!.val < preorder[i] { temp = stack.removeLast() }
            let child = TreeNode(preorder[i])
            if temp.val < preorder[i] {
                temp.right = child
            } else {
                temp.left = child
            }
            stack.append(child)
        }
        
        return root
    }

}