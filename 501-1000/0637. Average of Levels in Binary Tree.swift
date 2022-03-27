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

    // 637. Average of Levels in Binary Tree
    // Given the root of a binary tree, return the average value of the nodes on each level in the form of an array. Answers within 10-5 of the actual answer will be accepted.

    // Finds the average value of the nodes on each level in the form of an array.

    // - Parameter root: Binary tree root.
    // - Returns: The average value of the nodes on each level.

    // Example 1:
    // Input: root = [3,9,20,null,15,7]
    // Output: [3.00000,14.50000,11.00000]
    // Explanation: The average value of nodes on level 0 is 3, on level 1 is 14.5, and on level 2 is 11.
    // Hence return [3, 14.5, 11].

    // Example 2:
    // Input: root = [3,9,20,15,7]
    // Output: [3.00000,14.50000,11.00000]

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -2^31 <= Node.val <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var ans = [Double]()
        var queue = [TreeNode]()

        queue.append(root)

        while !queue.isEmpty {
            var tmp = 0
            var count = queue.count
            for i in 0..<count {
                let first = queue.removeFirst()
                tmp += first.val
                if let left = first.left { queue.append(left) }
                if let right = first.right { queue.append(right) }
            }
            
            ans.append(Double(tmp) / Double(count))
        }
        
        return ans
    }

}