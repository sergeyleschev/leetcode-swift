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

    // 450. Delete Node in a BST
    // Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
    // Basically, the deletion can be divided into two stages:
    // Search for a node to remove.
    // If the node is found, delete the node.
    // Follow up: Can you solve it with time complexity O(height of tree)?

    // Deletes the node with the given key.

    // - Parameters:
    //   - root: Binary tree root.
    //   - key: Key for a node to remove.
    // - Returns: Binary tree root.

    // Example 1:
    // Input: root = [5,3,6,2,4,null,7], key = 3
    // Output: [5,4,6,2,null,null,7]
    // Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
    // One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
    // Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

    // Example 2:
    // Input: root = [5,3,6,2,4,null,7], key = 0
    // Output: [5,3,6,2,4,null,7]
    // Explanation: The tree does not contain a node with value = 0.

    // Example 3:
    // Input: root = [], key = 0
    // Output: []

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // -10^5 <= Node.val <= 10^5
    // Each node has a unique value.
    // root is a valid binary search tree.
    // -10^5 <= key <= 10^5

    // - Complexity:
    //   - time: O(log(n)), where n is the number of nodes in the tree.
    //   - space: O(h), where h is a tree height.
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == key {
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            }

            let minVal = findMin(root.right)
            root.val = minVal
            root.right = deleteNode(root.right, root.val)

        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        }

        return root
    }


    private func findMin(_ node: TreeNode?) -> Int {
        guard var node = node else { return -1 }
        while let left = node.left { node = left }
        return node.val
    }

}