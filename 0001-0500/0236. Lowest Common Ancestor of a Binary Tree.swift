/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {

    // Solution @ Sergey Leschev

    // 236. Lowest Common Ancestor of a Binary Tree
    // Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
    // According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

    // Example 1:
    // Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
    // Output: 3
    // Explanation: The LCA of nodes 5 and 1 is 3.

    // Example 2:
    // Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
    // Output: 5
    // Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

    // Example 3:
    // Input: root = [1,2], p = 1, q = 2
    // Output: 1
     
    // Constraints:
    // The number of nodes in the tree is in the range [2, 10^5].
    // -10^9 <= Node.val <= 10^9
    // All Node.val are unique.
    // p != q
    // p and q will exist in the tree.

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var nodeP: Node?
        var nodeQ: Node?
        var set: Set<Node?> = []
        

        func rebuildBinaryTree(_ root: TreeNode?, _ parent: Node?) -> Node? {
            guard let root = root else { return nil }
            
            let _root = Node(root)
            _root.parent = parent
            _root.left = rebuildBinaryTree(root.left, _root)
            _root.right = rebuildBinaryTree(root.right, _root)
            if p === root { nodeP = _root }
            if q === root { nodeQ = _root }
            return _root
        }
        
        rebuildBinaryTree(root, nil)

        var curr = nodeP
        while curr != nil {
            set.insert(curr)
            curr = curr?.parent
        }
        curr = nodeQ
        while curr != nil {
            if set.contains(curr) { return curr?.node }
            curr = curr?.parent
        }
        
        return nil
    }

}


class Node {
    var node: TreeNode
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(_ node: TreeNode) { self.node = node }
}


extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool { lhs.node.val == rhs.node.val }
    public func hash(into hasher: inout Hasher) { hasher.combine(self.node.val) }
}