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

    // 993. Cousins in Binary Tree
    // In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
    // Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
    // We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
    // Return true if and only if the nodes corresponding to the values x and y are cousins.

    // Example 1:
    // Input: root = [1,2,3,4], x = 4, y = 3
    // Output: false

    // Example 2:
    // Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
    // Output: true

    // Example 3:
    // Input: root = [1,2,3,null,4], x = 2, y = 3
    // Output: false

    // Constraints:
    // The number of nodes in the tree will be between 2 and 100.
    // Each node has a unique integer value from 1 to 100.

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue: [TreeNode?] = [root]
        var parentX: Int? = nil
        var parentY: Int? = nil

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                var cur = queue.removeFirst()
                
                if let left = cur?.left {
                    if left.val == x { parentX = cur?.val }
                    else if left.val == y { parentY = cur?.val }
                    queue.append(left)
                }
                
                if let right = cur?.right {
                    if right.val == x { parentX = cur?.val }
                    else if right.val == y { parentY = cur?.val }
                    queue.append(right)
                }
            }

            if (parentX == nil && parentY != nil) || (parentX != nil && parentY == nil) { return false }
            if let pX = parentX, let pY = parentY, pX != pY { return true }
        }
        return false
    }

}