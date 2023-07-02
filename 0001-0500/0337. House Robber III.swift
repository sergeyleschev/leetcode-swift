/// Definition for a binary tree node.
/// public class TreeNode {
///     public var val: Int
///     public var left: TreeNode?
///     public var right: TreeNode?
///     public init() { self.val = 0; self.left = nil; self.right = nil; }
///     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
///     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
///         self.val = val
///         self.left = left
///         self.right = right
///     }
/// }
class Solution {

    // Solution by Sergey Leschev

    // 337. House Robber III
    // The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.
    // Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.
    // Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

    // Determines the maximum amount of money the thief can rob tonight without alerting the police.

    // - Parameter root: Binary tree root.
    // - Returns: The maximum amount of money the thief can rob.

    // Example 1:
    // Input: root = [3,2,3,null,3,null,1]
    // Output: 7
    // Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.

    // Example 2:
    // Input: root = [3,4,5,1,3,null,1]
    // Output: 9
    // Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // 0 <= Node.val <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.

    func rob(_ root: TreeNode?) -> Int {
        let ans = dfs(root)
        return max(ans.0, ans.1)
    }

    private func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }

        let left = dfs(root.left)
        let right = dfs(root.right)

        let rob = root.val + left.1 + right.1
        let notRob = max(left.0, left.1) + max(right.0, right.1)

        return (rob, notRob)
    }

}
