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

    // 669. Trim a Binary Search Tree
    // Given the root of a binary search tree and the lowest and highest boundaries as low and high, trim the tree so that all its elements lies in [low, high]. Trimming the tree should not change the relative structure of the elements that will remain in the tree (i.e., any node's descendant should remain a descendant). It can be proven that there is a unique answer.
    // Return the root of the trimmed binary search tree. Note that the root may change depending on the given bounds.

    // Trims the tree so that all its elements lie in `[low, high]`.

    // - Parameters:
    //   - root: Binary tree root.
    //   - low: Lowest boundary.
    //   - high: Highest boundary.
    // - Returns: The root of the trimmed binary search tree.

    // Example 1:
    // Input: root = [1,0,2], low = 1, high = 2
    // Output: [1,null,2]

    // Example 2:
    // Input: root = [3,0,4,null,2,null,null,1], low = 1, high = 3
    // Output: [3,2,null,1]

    // Example 3:
    // Input: root = [1], low = 1, high = 2
    // Output: [1]

    // Example 4:
    // Input: root = [1,null,2], low = 1, high = 3
    // Output: [1,null,2]

    // Example 5:
    // Input: root = [1,null,2], low = 2, high = 4
    // Output: [2]

    // Constraints:
    // The number of nodes in the tree in the range [1, 10^4].
    // 0 <= Node.val <= 10^4
    // The value of each node in the tree is unique.
    // root is guaranteed to be a valid binary search tree.
    // 0 <= low <= high <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.
    
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val > high { return trimBST(root.left, low, high) }
        if root.val < low { return trimBST(root.right, low, high) }
        
        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)
        return root
    }

}