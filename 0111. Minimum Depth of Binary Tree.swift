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

    // 111. Minimum Depth of Binary Tree
    // Given a binary tree, find its minimum depth.
    // The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
    // Note: A leaf is a node with no children.

    // Finds the minimum depth in a binary tree.

    // - Parameter root: Binary tree root.
    // - Returns: The minimum depth.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: 2

    // Example 2:
    // Input: root = [2,null,3,null,4,null,5,null,6]
    // Output: 5
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 105].
    // -1000 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.

    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue: [TreeNode] = [root]
        var index = 1
        
        loop:
        while queue.count > 0 {
            var level: [TreeNode] = []
            for node in queue {
                if node.left == nil && node.right == nil { break loop }
                if let left = node.left { level.append(left) }
                if let right = node.right { level.append(right) }
            }
            queue = level
            index += 1
        }
        
        return index
    }
    
}