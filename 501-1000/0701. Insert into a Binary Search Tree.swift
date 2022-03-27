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

    // 701. Insert into a Binary Search Tree
    // You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
    // Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

    // Inserts new value in a Binary Search Tree (BST).

    // - Parameters:
    //   - root: The root node of the tree.
    //   - val: A value to insert into the tree.
    // - Returns: The root node of the tree after the insertion.

    // Example 1:
    // Input: root = [4,2,7,1,3], val = 5
    // Output: [4,2,7,1,3,5]
    // Explanation: Another accepted tree is:

    // Example 2:
    // Input: root = [40,20,60,10,30,50,70], val = 25
    // Output: [40,20,60,10,30,50,70,null,null,25]

    // Example 3:
    // Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
    // Output: [4,2,7,1,3,5]

    // Constraints:
    // The number of nodes in the tree will be in the range [0, 10^4].
    // -10^8 <= Node.val <= 10^8
    // All the values Node.val are unique.
    // -10^8 <= val <= 10^8
    // It's guaranteed that val does not exist in the original BST.

    // - Complexity:
    //   - time: O(h), where h is the height of the tree.
    //   - space: O(1), only constant space is used.
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        var cur: TreeNode? = root

        while let curVal = cur?.val {
            if curVal > val {
                guard cur?.left != nil else { cur?.left = TreeNode(val); break }
                cur = cur?.left
            } else {
                guard cur?.right != nil else { cur?.right = TreeNode(val); break }
                cur = cur?.right
            }
        }

        return root
    }

}