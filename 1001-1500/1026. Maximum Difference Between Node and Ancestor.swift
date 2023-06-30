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

    // 1026. Maximum Difference Between Node and Ancestor
    // Given the root of a binary tree, find the maximum value V for which there exist different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.
    // A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.

    // Finds the maximum value V for which there exist different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.

    // - Parameter root: Binary tree root.
    // - Returns: The maximum value V.

    // Example 1:
    // Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
    // Output: 7
    // Explanation: We have various ancestor-node differences, some of which are given below :
    // |8 - 3| = 5
    // |3 - 7| = 4
    // |8 - 1| = 7
    // |10 - 13| = 3
    // Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.

    // Example 2:
    // Input: root = [1,null,2,null,0,3]
    // Output: 3

    // Constraints:
    // The number of nodes in the tree is in the range [2, 5000].
    // 0 <= Node.val <= 10^5

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.
    
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return dfs(root, curMax: root.val, curMin: root.val)
    }

    
    private func dfs(_ root: TreeNode?, curMax: Int, curMin: Int) -> Int {
        guard let root = root else { return curMax - curMin }

        let curMax = max(curMax, root.val)
        let curMin = min(curMin, root.val)

        let left = dfs(root.left, curMax: curMax, curMin: curMin)
        let right = dfs(root.right, curMax: curMax, curMin: curMin)

        return max(left, right)
    }

}