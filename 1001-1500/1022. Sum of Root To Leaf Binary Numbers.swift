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

    // Solution by Sergey Leschev

    // 1022. Sum of Root To Leaf Binary Numbers
    // You are given the root of a binary tree where each node has a value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
    // For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.
    // Return the sum of these numbers. The answer is guaranteed to fit in a 32-bits integer.

    // Calculates the sum where the numbers are represented by the path from the root to the leaf.

    // - Parameter root: Binary tree root.
    // - Returns: The sum.

    // Example 1:
    // Input: root = [1,0,1,0,1,0,1]
    // Output: 22
    // Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22

    // Example 2:
    // Input: root = [0]
    // Output: 0

    // Example 3:
    // Input: root = [1]
    // Output: 1

    // Example 4:
    // Input: root = [1,1]
    // Output: 3

    // Constraints:
    // The number of nodes in the tree is in the range [1, 1000].
    // Node.val is 0 or 1.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var ans = 0
        dfs(root, root.val, &ans)
        return ans
    }

    
    private func dfs(_ root: TreeNode, _ currNumber: Int, _ ans: inout Int) {
        if root.left == nil, root.right == nil { ans += currNumber; return }
        
        if let left = root.left { dfs(left, (currNumber * 2) + left.val, &ans) }
        if let right = root.right { dfs(right, (currNumber * 2) + right.val, &ans) }
    }

}