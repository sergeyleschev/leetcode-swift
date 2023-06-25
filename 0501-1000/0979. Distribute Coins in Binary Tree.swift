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

    // 979. Distribute Coins in Binary Tree
    // You are given the root of a binary tree with n nodes where each node in the tree has node.val coins. There are n coins in total throughout the whole tree.
    // In one move, we may choose two adjacent nodes and move one coin from one node to another. A move may be from parent to child, or from child to parent.
    // Return the minimum number of moves required to make every node have exactly one coin.

    // Example 1:
    // Input: root = [3,0,0]
    // Output: 2
    // Explanation: From the root of the tree, we move one coin to its left child, and one coin to its right child.

    // Example 2:
    // Input: root = [0,3,0]
    // Output: 3
    // Explanation: From the left child of the root, we move two coins to the root [taking two moves]. Then, we move one coin from the root of the tree to the right child.

    // Example 3:
    // Input: root = [1,0,2]
    // Output: 2

    // Example 4:
    // Input: root = [1,0,0,null,3]
    // Output: 4

    // Constraints:
    // The number of nodes in the tree is n.
    // 1 <= n <= 100
    // 0 <= Node.val <= n
    // The sum of all Node.val is n.

    private var ans = 0
    

    func distributeCoins(_ root: TreeNode?) -> Int {
        ans = 0
        dfs(root)
        return ans
    }
    

    @discardableResult
    private func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let L = dfs(node.left)
        let R = dfs(node.right)
        ans += (abs(L) + abs(R))
        return node.val + L + R - 1
    }

}