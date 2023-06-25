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

    // 687. Longest Univalue Path
    // Given the root of a binary tree, return the length of the longest path, where each node in the path has the same value. This path may or may not pass through the root.
    // The length of the path between two nodes is represented by the number of edges between them.

    // Example 1:
    // Input: root = [5,4,5,1,1,5]
    // Output: 2

    // Example 2:
    // Input: root = [1,4,5,4,4,5]
    // Output: 2

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // -1000 <= Node.val <= 1000
    // The depth of the tree will not exceed 1000.

    var ans = 0
    
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        findLongest(root)
        return ans
    }
    
    
    func findLongest(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        let left = findLongest(root?.left)
        var right = findLongest(root?.right)
        var leftLength = 0
        var rightLength = 0

        if root?.left?.val == root?.val { leftLength = left + 1 }
        if root?.right?.val == root?.val { rightLength = right + 1 }
        
        ans = max(ans, leftLength + rightLength)
        return max(leftLength, rightLength)
        
    }

}