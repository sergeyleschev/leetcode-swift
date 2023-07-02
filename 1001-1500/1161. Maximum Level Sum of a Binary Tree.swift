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

    // 1161. Maximum Level Sum of a Binary Tree
    // Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.
    // Return the smallest level x such that the sum of all the values of nodes at level x is maximal.

    // Example 1:
    // Input: root = [1,7,0,7,-8,null,null]
    // Output: 2
    // Explanation:
    // Level 1 sum = 1.
    // Level 2 sum = 7 + 0 = 7.
    // Level 3 sum = 7 + -8 = -1.
    // So we return the level with the maximum sum which is level 2.

    // Example 2:
    // Input: root = [989,null,10250,98693,-89388,null,null,null,-32127]
    // Output: 2

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -10^5 <= Node.val <= 10^5

    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var level = 0
        var maxLevel = (0, Int.min)

        while !queue.isEmpty {
            level += 1
            let sum = queue.reduce(0, { $0 + $1.val })
            if sum > maxLevel.1 { maxLevel = (level, sum) }
            queue = queue.flatMap { [$0.left, $0.right].compactMap { $0 } }
        }

        return maxLevel.0
    }

}
