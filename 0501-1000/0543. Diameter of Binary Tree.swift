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

    // 543. Diameter of Binary Tree
    // Given the root of a binary tree, return the length of the diameter of the tree.
    // The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
    // The length of a path between two nodes is represented by the number of edges between them.

    // Example 1:
    // Input: root = [1,2,3,4,5]
    // Output: 3
    // Explanation: 3is the length of the path [4,2,1,3] or [5,2,1,3].

    // Example 2:
    // Input: root = [1,2]
    // Output: 1

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -100 <= Node.val <= 100

    var maxPath = 0


    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        helper(root)
        return maxPath
    }
    

    func helper(_ node: TreeNode) -> Int {
        var leftpath = 0, rightpath = 0

        if let leftChild = node.left { leftpath = helper(leftChild) + 1 }
        if let rightChild = node.right { rightpath = helper(rightChild) + 1 }

        maxPath = max(maxPath, leftpath + rightpath)
        return max(leftpath, rightpath)  
    }
    
}