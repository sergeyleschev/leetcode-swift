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

    // 938. Range Sum of BST
    // Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].

    // Finds the sum of values of all nodes with a value in the range [low, high].

    // - Parameters:
    //   - root: Binary tree root.
    //   - low: Lower range.
    //   - high: Upper range.
    // - Returns: The sum of values of all nodes with a value in the range.

    // Example 1:
    // Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
    // Output: 32
    // Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.

    // Example 2:
    // Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
    // Output: 23
    // Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.

    // Constraints:
    // The number of nodes in the tree is in the range [1, 2 * 10^4].
    // 1 <= Node.val <= 10^5
    // 1 <= low <= high <= 10^5
    // All Node.val are unique.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }

        if root.val < low { return rangeSumBST(root.right, low, high) }
        if root.val > high { return rangeSumBST(root.left, low, high) }
        
        return root.val + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
    }

}