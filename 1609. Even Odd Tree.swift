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

    // 1609. Even Odd Tree
    // A binary tree is named Even-Odd if it meets the following conditions:
    // The root of the binary tree is at level index 0, its children are at level index 1, their children are at level index 2, etc.
    // For every even-indexed level, all nodes at the level have odd integer values in strictly increasing order (from left to right).
    // For every odd-indexed level, all nodes at the level have even integer values in strictly decreasing order (from left to right).
    // Given the root of a binary tree, return true if the binary tree is Even-Odd, otherwise return false.

    // Example 1:
    // Input: root = [1,10,4,3,null,7,9,12,8,6,null,null,2]
    // Output: true
    // Explanation: The node values on each level are:
    // Level 0: [1]
    // Level 1: [10,4]
    // Level 2: [3,7,9]
    // Level 3: [12,8,6,2]
    // Since levels 0 and 2 are all odd and increasing, and levels 1 and 3 are all even and decreasing, the tree is Even-Odd.

    // Example 2:
    // Input: root = [5,4,2,3,3,7]
    // Output: false
    // Explanation: The node values on each level are:
    // Level 0: [5]
    // Level 1: [4,2]
    // Level 2: [3,3,7]
    // Node values in the level 2 must be in strictly increasing order, so the tree is not Even-Odd.

    // Example 3:
    // Input: root = [5,9,1,3,5,7]
    // Output: false
    // Explanation: Node values in the level 1 should be even integers.

    // Example 4:
    // Input: root = [1]
    // Output: true

    // Example 5:
    // Input: root = [11,8,6,1,3,9,11,30,20,18,16,12,10,4,2,17]
    // Output: true

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^5].
    // 1 <= Node.val <= 10^6

    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        var level = 0
        var q = [root]
        if root!.val.isMultiple(of: 2) { return false }

        while !q.isEmpty {
            var head = 0
            var newq = [TreeNode]()

            while head != q.endIndex {
                let node = q[head]; head += 1
                
                if let left = node?.left {
                    if left.val.isMultiple(of: 2) != level.isMultiple(of: 2) { return false }
                    if !newq.isEmpty {
                        if level.isMultiple(of: 2), left.val >= newq.last!.val { return false }
                        if !level.isMultiple(of: 2), left.val <= newq.last!.val { return false }
                    }
                    newq.append(left)
                }

                if let right = node?.right {
                    if right.val.isMultiple(of: 2) != level.isMultiple(of: 2) { return false }
                    if !newq.isEmpty {
                        if level.isMultiple(of: 2), right.val >= newq.last!.val { return false }
                        if !level.isMultiple(of: 2), right.val <= newq.last!.val { return false }
                    }
                    newq.append(right)
                }
            }
            
            q = newq
            level += 1
        }
        return true
    }

}