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

    // 530. Minimum Absolute Difference in BST
    // Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

    // Example 1:
    // Input: root = [4,2,6,1,3]
    // Output: 1

    // Example 2:
    // Input: root = [1,0,48,null,null,12,49]
    // Output: 1

    // Constraints:
    // The number of nodes in the tree is in the range [2, 10^4].
    // 0 <= Node.val <= 10^5

    // - Complexity: 
    //   - Time: O(n), n is the number of nodes in the tree. It takes O(n) to complete inorder, Then, takes O(n) to computer minimum differences.
    //   - Space: O(n), n is the number of nodes in the tree. It stores values in every node.

    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var list = [Int]()
        var minDiff = Int.max


        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            list.append(root.val)
            inorder(root.right)
        }

        inorder(root)
        for index in stride(from: 1, to: list.count, by: 1) {
            minDiff = min(minDiff, list[index] - list[index - 1])
        }

        return minDiff
    }

}