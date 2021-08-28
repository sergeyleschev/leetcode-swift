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

    // 662. Maximum Width of Binary Tree
    // Given the root of a binary tree, return the maximum width of the given tree.
    // The maximum width of a tree is the maximum width among all levels.
    // The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes are also counted into the length calculation.
    // It is guaranteed that the answer will in the range of 32-bit signed integer.

    // Example 1:
    // Input: root = [1,3,2,5,3,null,9]
    // Output: 4
    // Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

    // Example 2:
    // Input: root = [1,3,null,5,3]
    // Output: 2
    // Explanation: The maximum width existing in the third level with the length 2 (5,3).

    // Example 3:
    // Input: root = [1,3,2,5]
    // Output: 2
    // Explanation: The maximum width existing in the second level with the length 2 (3,2).

    // Example 4:
    // Input: root = [1,3,2,5,null,null,9,6,null,null,7]
    // Output: 8
    // Explanation: The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).

    // Constraints:
    // The number of nodes in the tree is in the range [1, 3000].
    // -100 <= Node.val <= 100

    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [TreeNode] = [root]
        var list: [Int] = [1]
        var maxLen = 1
    
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                let index = list.removeFirst()
                if let left = node.left {
                    queue.append(left)
                    list.append(2 &* index)
                }
                if let right = node.right {
                    queue.append(right)
                    list.append(2 &* index &+ 1)
                }
            }
            if list.count >= 2 {
                maxLen = max(maxLen, list.last! &- list.first! &+ 1)
            }
        }
        
        return maxLen
    }
    
}