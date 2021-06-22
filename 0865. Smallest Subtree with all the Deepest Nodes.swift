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

    // 865. Smallest Subtree with all the Deepest Nodes
    // Given the root of a binary tree, the depth of each node is the shortest distance to the root.
    // Return the smallest subtree such that it contains all the deepest nodes in the original tree.
    // A node is called the deepest if it has the largest depth possible among any node in the entire tree.
    // The subtree of a node is tree consisting of that node, plus the set of all descendants of that node. 

    // Finds the smallest subtree such that it contains all the deepest nodes in the original tree.

    // - Parameter root: Binary tree root.
    // - Returns: The smallest subtree.

    // Example 1:
    // Input: root = [3,5,1,6,2,0,8,null,null,7,4]
    // Output: [2,7,4]
    // Explanation: We return the node with value 2, colored in yellow in the diagram.
    // The nodes coloured in blue are the deepest nodes of the tree.
    // Notice that nodes 5, 3 and 2 contain the deepest nodes in the tree but node 2 is the smallest subtree among them, so we return it.
    
    // Example 2:
    // Input: root = [1]
    // Output: [1]
    // Explanation: The root is the deepest node in the tree.
    
    // Example 3:
    // Input: root = [0,1,3,null,2]
    // Output: [2]
    // Explanation: The deepest node in the tree is 2, the valid subtrees are the subtrees of nodes 2, 1 and 0 but the subtree of node 2 is the smallest.

    // Constraints:
    // The number of nodes in the tree will be in the range [1, 500].
    // 0 <= Node.val <= 500
    // The values of the nodes in the tree are unique.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? { dfs(root).node }
    
    
    private func dfs(_ root: TreeNode?) -> (node: TreeNode?, dist: Int) {
        guard let root = root else { return (nil, 0) }
        
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        if left.dist > right.dist { return (left.node, left.dist + 1) }
        if left.dist < right.dist { return (right.node, right.dist + 1) }
        
        return (root, left.dist + 1)
    }

}