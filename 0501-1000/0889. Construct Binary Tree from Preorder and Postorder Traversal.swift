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

    // 889. Construct Binary Tree from Preorder and Postorder Traversal
    // Return any binary tree that matches the given preorder and postorder traversals.
    // Values in the traversals pre and post are distinct positive integers.

    // Example 1:
    // Input: pre = [1,2,4,5,3,6,7], post = [4,5,2,6,7,3,1]
    // Output: [1,2,3,4,5,6,7]

    // Note:
    // 1 <= pre.length == post.length <= 30
    // pre[] and post[] are both permutations of 1, 2, ..., pre.length.
    // It is guaranteed an answer exists. If there exists multiple answers, you can return any of them.

    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? { constructFromPrePost(pre, post, 0, 0, pre.count) }

    
    func constructFromPrePost(_ pre: [Int], _ post: [Int], _ preStart: Int, _ postStart: Int, _ count: Int) -> TreeNode? {
        guard count > 0 else { return nil }
        let root = TreeNode(pre[preStart])
        guard count > 1 else { return root }
        var splitIndex = -1
        
        for i in 1..<count {
            if pre[preStart + 1] == post[i + postStart - 1] {
                splitIndex = i
                break
            }
        }
        
        root.left = constructFromPrePost(pre, post, preStart + 1, postStart, splitIndex)
        root.right = constructFromPrePost(pre, post, preStart + splitIndex + 1, postStart + splitIndex, count - splitIndex - 1)
        return root
    }

}