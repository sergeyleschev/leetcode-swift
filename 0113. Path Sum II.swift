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

    // 113. Path Sum II
    // Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where each path's sum equals targetSum.
    // A leaf is a node with no children.

    // Example 1:
    // Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
    // Output: [[5,4,11,2],[5,8,4,5]]

    // Example 2:
    // Input: root = [1,2,3], targetSum = 5
    // Output: []

    // Example 3:
    // Input: root = [1,2], targetSum = 0
    // Output: []
     
    // Constraints:
    // The number of nodes in the tree is in the range [0, 5000].
    // -1000 <= Node.val <= 1000
    // -1000 <= targetSum <= 1000

    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var res: [[Int]] = []
        
        
        func backtrack(_ path: [Int], _ root: TreeNode?, _ target: Int) {
            guard let root = root else { return }
            
            if root.val == target && root.left == nil && root.right == nil {
                res.append(path + [root.val])
                return
            }
            
            var path = path
            for i in 0..<2 {
                if let node = (i == 0 ? root.left : root.right) {
                    path.append(root.val)
                    backtrack(path, node, target - root.val)
                    path.removeLast()
                }
            }    
        }
        
        backtrack([], root, targetSum)
        return res
    }
    
}