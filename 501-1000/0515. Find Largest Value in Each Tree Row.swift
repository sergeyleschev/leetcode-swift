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

    // 515. Find Largest Value in Each Tree Row
    // Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

    // Example 1:
    // Input: root = [1,3,2,5,3,null,9]
    // Output: [1,3,9]

    // Example 2:
    // Input: root = [1,2,3]
    // Output: [1,3]

    // Example 3:
    // Input: root = [1]
    // Output: [1]

    // Example 4:
    // Input: root = [1,null,2]
    // Output: [1,2]

    // Example 5:
    // Input: root = []
    // Output: []

    // Constraints:
    // The number of nodes in the tree will be in the range [0, 10^4].
    // -2^31 <= Node.val <= 2^31 - 1

    func largestValues(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        operation(root, depth: 0, maxs: &res)
        return res
    }
    
    
    func operation(_ root: TreeNode?, depth: Int, maxs: inout [Int]) {
        guard let tree = root else { return }

        if depth >= maxs.count {
            maxs.append(tree.val)
        } else {
            maxs[depth] = max(maxs[depth], tree.val)
        }
        
        operation(tree.left, depth: depth + 1, maxs: &maxs)
        operation(tree.right, depth: depth + 1, maxs: &maxs)
    }
    
}