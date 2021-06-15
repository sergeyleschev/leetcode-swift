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

    // 654. Maximum Binary Tree
    // You are given an integer array nums with no duplicates. A maximum binary tree can be built recursively from nums using the following algorithm:
    // Create a root node whose value is the maximum value in nums.
    // Recursively build the left subtree on the subarray prefix to the left of the maximum value.
    // Recursively build the right subtree on the subarray suffix to the right of the maximum value.
    // Return the maximum binary tree built from nums.

    // Example 1:
    // Input: nums = [3,2,1,6,0,5]
    // Output: [6,3,5,null,2,0,null,null,1]
    // Explanation: The recursive calls are as follow:
    // - The largest value in [3,2,1,6,0,5] is 6. Left prefix is [3,2,1] and right suffix is [0,5].
    //     - The largest value in [3,2,1] is 3. Left prefix is [] and right suffix is [2,1].
    //         - Empty array, so no child.
    //         - The largest value in [2,1] is 2. Left prefix is [] and right suffix is [1].
    //             - Empty array, so no child.
    //             - Only one element, so child is a node with value 1.
    //     - The largest value in [0,5] is 5. Left prefix is [0] and right suffix is [].
    //         - Only one element, so child is a node with value 0.
    //         - Empty array, so no child.

    // Example 2:
    // Input: nums = [3,2,1]
    // Output: [3,null,2,null,1]

    // Constraints:
    // 1 <= nums.length <= 1000
    // 0 <= nums[i] <= 1000
    // All integers in nums are unique.

    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        return self.buildTree(nums, 0, nums.count - 1)
    }
    
    
    func buildTree(_ nums:[Int],_ start:Int,_ end:Int) -> TreeNode? {
        guard start <= end else { return nil }
        var max = start
        var i = start + 1

        while i <= end {
            if nums[i] > nums[max] { max = i }
            i += 1
        }
        
        let root = TreeNode(nums[max])
        root.left = buildTree(nums, start, max - 1)
        root.right = buildTree(nums, max + 1, end)
        
        return root
    }
    
}