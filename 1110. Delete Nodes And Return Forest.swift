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

    // 1110. Delete Nodes And Return Forest
    // Given the root of a binary tree, each node in the tree has a distinct value.
    // After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).
    // Return the roots of the trees in the remaining forest. You may return the result in any order.

    // Example 1:
    // Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
    // Output: [[1,2,null,4],[6],[7]]

    // Example 2:
    // Input: root = [1,2,4,null,3], to_delete = [3]
    // Output: [[1,2,4]]

    // Constraints:
    // The number of nodes in the given tree is at most 1000.
    // Each node has a distinct value between 1 and 1000.
    // to_delete.length <= 1000
    // to_delete contains distinct values between 1 and 1000.

    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else { return [] }
        let toDelete = Set(to_delete)
        var result = [TreeNode?]()

        delNodes(root, toDelete, &result)
        
        if !toDelete.contains(root.val) { result.append(root) }
        return result
    }
        
        
    func delNodes(_ root: TreeNode?, _ toDelete: Set<Int>, _ result: inout [TreeNode?]) -> TreeNode? {
        guard let root = root else { return nil }
        
        root.left = delNodes(root.left, toDelete, &result)
        root.right = delNodes(root.right, toDelete, &result)
        
        if toDelete.contains(root.val) {
            if let left = root.left { result.append(left) }
            if let right = root.right { result.append(right) }
            return nil
        }
        
        return root
    }
    
}