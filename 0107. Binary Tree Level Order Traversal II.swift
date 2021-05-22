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

    // 107. Binary Tree Level Order Traversal II
    // Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

    // Returns the bottom-up level order traversal of binary tree nodes' values.

    // - Parameter root: Binary tree root.
    // - Returns: The bottom-up level order traversal of nodes' values.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: [[15,7],[9,20],[3]]

    // Example 2:
    // Input: root = [1]
    // Output: [[1]]

    // Example 3:
    // Input: root = []
    // Output: []
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 2000].
    // -1000 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var ans = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            ans.insert(level, at: 0)
        }

        return ans
    }

}