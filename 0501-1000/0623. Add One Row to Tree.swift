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

    // Solution @ Sergey Leschev

    // 623. Add One Row to Tree
    // Given the root of a binary tree and two integers val and depth, add a row of nodes with value val at the given depth depth.
    // Note that the root node is at depth 1.
    // The adding rule is:
    // Given the integer depth, for each not null tree node cur at the depth depth - 1, create two tree nodes with value val as cur's left subtree root and right subtree root.
    // cur's original left subtree should be the left subtree of the new left subtree root.
    // cur's original right subtree should be the right subtree of the new right subtree root.
    // If depth == 1 that means there is no depth depth - 1 at all, then create a tree node with value val as the new root of the whole original tree, and the original tree is the new root's left subtree.

    // Adds one row to the tree.

    // - Parameters:
    //   - root: Binary tree root.
    //   - v: The value.
    //   - d: The depth.
    // - Returns: Binary tree root.

    // Example 1:
    // Input: root = [4,2,6,3,1,5], val = 1, depth = 2
    // Output: [4,1,1,2,null,null,6,3,1,5]

    // Example 2:
    // Input: root = [4,2,null,3,1], val = 1, depth = 3
    // Output: [4,2,null,1,1,3,null,null,1]

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // The depth of the tree is in the range [1, 10^4].
    // -100 <= Node.val <= 100
    // -10^5 <= val <= 10^5
    // 1 <= depth <= the depth of tree + 1

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        guard d > 1 else { return TreeNode(v, root, nil) }
        guard let root = root else { return TreeNode(v) }
        var queue = [TreeNode]()
        var depth = 1

        queue.append(root)
        while depth < d - 1 {
            var tmp = [TreeNode]()
            while !queue.isEmpty {
                let node = queue.removeFirst()
                if let left = node.left { tmp.append(left) }
                if let right = node.right { tmp.append(right) }
            }
            queue = tmp
            depth += 1
        }

        while !queue.isEmpty {
            let node = queue.removeFirst()
            node.left = TreeNode(v, node.left, nil)
            node.right = TreeNode(v, nil, node.right)
        }
        
        return root
    }

}

