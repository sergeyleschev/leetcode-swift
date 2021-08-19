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

    // 199. Binary Tree Right Side View
    // Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

    // Finds the values of the nodes you can see ordered from top to bottom
    // when you are standing on the right side of the tree.

    // - Parameter root: Binary tree root.
    // - Returns: Visible values of the nodes.

    // Example 1:
    // Input: root = [1,2,3,null,5,null,4]
    // Output: [1,3,4]

    // Example 2:
    // Input: root = [1,null,3]
    // Output: [1,3]

    // Example 3:
    // Input: root = []
    // Output: []

    // Constraints:
    // The number of nodes in the tree is in the range [0, 100].
    // -100 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.

    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            if let last = queue.last { ans.append(last.val) }
            
            for i in 0..<queue.count {
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        
        return ans
    }

}