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

    // 538. Convert BST to Greater Tree
    // Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
    // As a reminder, a binary search tree is a tree that satisfies these constraints:
    // The left subtree of a node contains only nodes with keys less than the node's key.
    // The right subtree of a node contains only nodes with keys greater than the node's key.
    // Both the left and right subtrees must also be binary search trees.

    // Converts BST to a Greater Tree such that every key of the original BST
    // is changed to the original key plus the sum of all keys greater than the original key in BST.

    // - Parameter root: Binary search tree root.
    // - Returns: Greater Tree root.

    // Example 1:
    // Input: root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
    // Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]

    // Example 2:
    // Input: root = [0,null,1]
    // Output: [1,null,1]

    // Example 3:
    // Input: root = [1,0,2]
    // Output: [3,3,2]

    // Example 4:
    // Input: root = [3,2,4,1]
    // Output: [7,9,4,10]

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // -10^4 <= Node.val <= 10^4
    // All the values in the tree are unique.
    // root is guaranteed to be a valid binary search tree.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        dfs(root, &sum)
        return root
    }
    
    
    private func dfs(_ root: TreeNode?, _ sum: inout Int) {
        guard let root = root else { return }
        
        dfs(root.right, &sum)
        sum += root.val
        root.val = sum
        dfs(root.left, &sum)
    }

}