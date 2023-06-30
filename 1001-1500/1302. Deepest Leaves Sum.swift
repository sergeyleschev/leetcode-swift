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

    // 1302. Deepest Leaves Sum
    // Given the root of a binary tree, return the sum of values of its deepest leaves.

    // Example 1:
    // Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
    // Output: 15

    // Example 2:
    // Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
    // Output: 19

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // 1 <= Node.val <= 100

    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        var cache = [node]
        
        while true {
            var temp = [TreeNode]()

            for node in cache {
                if let left = node.left { temp.append(left) }
                if let right = node.right { temp.append(right) }
            }

            if temp.isEmpty { break } else { cache = temp }
        }
        
        return cache.reduce(0) { (res, node) -> Int in  res + node.val }
    }
    
}