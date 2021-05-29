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

    // 404. Sum of Left Leaves
    // Given the root of a binary tree, return the sum of all left leaves.

    // Finds the sum of all left leaves in a given binary tree.

    // - Parameter root: Binary tree root.
    // - Returns: The sum of all left leaves.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: 24
    // Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.

    // Example 2:
    // Input: root = [1]
    // Output: 0

    // Constraints:
    // The number of nodes in the tree is in the range [1, 1000].
    // -1000 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.

    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return dfs(root, false)
    }


    private func dfs(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        guard let root = root else { return 0 }
        guard root.left != nil || root.right != nil || !isLeft else { return root.val }

        return dfs(root.left, true) + dfs(root.right, false)
    }

}