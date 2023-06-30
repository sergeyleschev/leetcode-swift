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

    // 108. Convert Sorted Array to Binary Search Tree
    // Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
    // A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

    // Converts an array where elements are sorted in ascending order to a height
    // balanced BST.

    // - Parameter nums: An array.
    // - Returns: Binary Search Tree root.

    // Example 1:
    // Input: nums = [-10,-3,0,5,9]
    // Output: [0,-3,9,-10,null,5]
    // Explanation: [0,-10,5,null,-3,null,9] is also accepted:

    // Example 2:
    // Input: nums = [1,3]
    // Output: [3,1]
    // Explanation: [1,3] and [3,1] are both a height-balanced BSTs.
     
    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^4 <= nums[i] <= 10^4
    // nums is sorted in a strictly increasing order.

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        helper(nums, 0, nums.count - 1)
    }

    
    private func helper(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        guard lo <= hi else { return nil }

        let mid = lo + (hi - lo) / 2

        let root = TreeNode(nums[mid])
        root.left = helper(nums, lo, mid - 1)
        root.right = helper(nums, mid + 1, hi)

        return root
    }

}