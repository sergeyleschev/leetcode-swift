/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {

    // 116. Populating Next Right Pointers in Each Node
    // You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:
    // struct Node {
    //   int val;
    //   Node *left;
    //   Node *right;
    //   Node *next;
    // }
    // Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
    // Initially, all next pointers are set to NULL.

    // Follow up:
    // You may only use constant extra space.
    // Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.

    // Populates each next pointer to point to its next right node. If there is no
    // next right node, the next pointer should be set to nil.

    // - Parameter root: Binary tree root.
    // - Returns: Binary tree root.
     
    // Example 1:
    // Input: root = [1,2,3,4,5,6,7]
    // Output: [1,#,2,3,#,4,5,6,7,#]
    // Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
     
    // Constraints:
    // The number of nodes in the given tree is less than 4096.
    // -1000 <= node.val <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(1), only constant space is used.

    func connect(_ root: Node?) -> Node? {
        var leftMost = root

        while leftMost?.left != nil {
            var head = leftMost
            while head != nil {
                head?.left?.next = head?.right
                if let next = head?.next {
                    head?.right?.next = next.left
                }
                head = head?.next
            }
            leftMost = leftMost?.left
        }

        return root
    }

}