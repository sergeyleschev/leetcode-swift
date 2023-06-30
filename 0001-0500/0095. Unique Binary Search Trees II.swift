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

// 0  = (root, left, right) = 1
// 1  = (0, 0, 0) = 1 * 1
// 2  = (1, 1, 0) + (2 - 1, 0, 1) = 1 + 1 = 2
// 3  = (2, 2, 0) + (2, 1, 1) + (2, 0, 2) = 2 * 1 + 1 * 1 + 1 * 2 = 5
// 4  = (3, 3, 0) + (3, 2, 1) + (3, 1, 2) + (3, 0, 3) = 5 + 2 + 2 + 5 = 14

class Solution {

    // Solution by Sergey Leschev

    // 95. Unique Binary Search Trees II
    // Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

    // Example 1:
    // Input: n = 3
    // Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]

    // Example 2:
    // Input: n = 1
    // Output: [[1]]
     
    // Constraints:
    // 1 <= n <= 8

    func generateTrees(_ n: Int) -> [TreeNode?] {
        var nums: [Int] = []
        
        func copyNodes(_ node: TreeNode?, _ left: TreeNode?, _ right: TreeNode?) -> TreeNode? {
            if node == nil { return nil } 
            else {
                let newNode = TreeNode(node!.val)
                newNode.left = copyNodes(left, left?.left, left?.right)
                newNode.right = copyNodes(right, right?.left, right?.right)
                return newNode
            }
        }

        func generateNodes(_ node: TreeNode?, _ left: [TreeNode?], _ right: [TreeNode?]) -> [TreeNode?] {
            let leftCount = left.count > 0 ? left.count : 1
            let rightCount = right.count > 0 ? right.count : 1
            var res: [TreeNode?] = []
            
            for i in 0..<leftCount {
                let leftNode = left.count > 0 ? left[i] : nil
                for j in 0..<rightCount {
                    let rightNode = right.count > 0 ? right[j] : nil
                    res.append(copyNodes(node, leftNode, rightNode))
                }
            }
            return res
        }

        func nodes(_ nums: [Int]) -> [TreeNode?] {
            if nums.count == 0 { return [] }
            var res: [TreeNode?] = []

            for (i, num) in nums.enumerated() {
                let node = TreeNode(num)
                let leftNodes = i > 0 ? nodes(Array(nums[0..<i])) : nodes([])
                let rightNodes = i < nums.count - 1 ? nodes(Array(nums[i + 1...nums.count - 1])) : nodes([])
                res += generateNodes(node, leftNodes, rightNodes)
            }
            return res
        }
        
        for num in 1...n { nums.append(num) }
        return nodes(nums)
    }

}