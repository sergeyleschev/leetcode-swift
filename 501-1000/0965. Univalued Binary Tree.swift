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

    // 965. Univalued Binary Tree
    // A binary tree is univalued if every node in the tree has the same value.
    // Return true if and only if the given tree is univalued.

    // Example 1:
    // Input: [1,1,1,1,1,null,1]
    // Output: true

    // Example 2:
    // Input: [2,2,2,5,2]
    // Output: false

    // Note:
    // The number of nodes in the given tree will be in the range [1, 100].
    // Each node's value will be an integer in the range [0, 99].

    // BFS

    func isUnivalTree(_ root: TreeNode?) -> Bool {
        var queue: [TreeNode] = []
        
        if let root = root {
            queue.append(root)
            while (queue.count > 0) {
                let node = queue.removeFirst()
                if node.val != root.val { return false }
                if let leftNode = node.left { queue.append(leftNode) }
                if let rightNode = node.right { queue.append(rightNode) }
            }
        }
        
        return true
    }

}