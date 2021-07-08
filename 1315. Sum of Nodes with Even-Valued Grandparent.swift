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

    // 1315. Sum of Nodes with Even-Valued Grandparent
    // Given a binary tree, return the sum of values of nodes with even-valued grandparent.  (A grandparent of a node is the parent of its parent, if it exists.)
    // If there are no nodes with an even-valued grandparent, return 0.

    // Example 1:
    // Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
    // Output: 18
    // Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.

    // Constraints:
    // The number of nodes in the tree is between 1 and 10^4.
    // The value of nodes is between 1 and 100.

    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var ans = 0
        var nodes: [TreeNode] = [root!]
        
        while !nodes.isEmpty {
            let node = nodes.removeFirst()
            if node.val % 2 == 0 { ans += sum(node) }
            if let left = node.left { nodes.append(left) }
            if let right = node.right { nodes.append(right) }
        }

        return ans
    }
    
    
    func sum(_ node: TreeNode?) -> Int {
        let v1 = node?.left?.left?.val ?? 0
        let v2 = node?.left?.right?.val ?? 0
        let v3 = node?.right?.left?.val ?? 0
        let v4 = node?.right?.right?.val ?? 0    
        
        return v1 + v2 + v3 + v4
    }

}