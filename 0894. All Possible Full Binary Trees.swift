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

    // 894. All Possible Full Binary Trees
    // Given an integer n, return a list of all possible full binary trees with n nodes. Each node of each tree in the answer must have Node.val == 0.
    // Each element of the answer is the root node of one possible tree. You may return the final list of trees in any order.
    // A full binary tree is a binary tree where each node has exactly 0 or 2 children.

    // Example 1:
    // Input: n = 7
    // Output: [[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,0,0]]

    // Example 2:
    // Input: n = 3
    // Output: [[0,0,0]]

    // Constraints:
    // 1 <= n <= 20

    var memo = [Int: [TreeNode?]]()
    
    
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        if let res = memo[N] {
            return res
        } else {
            var ret = [TreeNode?]()
            if N == 1 {
                ret.append(TreeNode.init(0))
            } else if N % 2 == 1 {
                for left in 0..<N {
                    let right = N - 1 - left
                    for leftTree in allPossibleFBT(left) {
                        for rightTree in allPossibleFBT(right) {
                            let node = TreeNode.init(0)
                            node.left = leftTree
                            node.right = rightTree
                            ret.append(node)
                        }
                    }
                }
            }
            memo[N] = ret
            return ret
        }
    }
    
}