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

    // 652. Find Duplicate Subtrees
    // Given the root of a binary tree, return all duplicate subtrees.
    // For each kind of duplicate subtrees, you only need to return the root node of any one of them.
    // Two trees are duplicate if they have the same structure with the same node values.

    // Example 1:
    // Input: root = [1,2,3,4,null,2,4,null,null,4]
    // Output: [[2,4],[4]]

    // Example 2:
    // Input: root = [2,1,1]
    // Output: [[1]]

    // Example 3:
    // Input: root = [2,2,2,3,null,3,null]
    // Output: [[2,3],[3]]

    // Constraints:
    // The number of the nodes in the tree will be in the range [1, 10^4]
    // -200 <= Node.val <= 200

    var cache: [String: Int] = [:]
    var ans: [TreeNode?] = []
    
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        recursive(root)
        return ans
    }
    
    
    func recursive(_ node: TreeNode?) -> String {
        guard let node = node else { return "#" }

        let literal = "," + recursive(node.left) + "," + String(node.val) + "," + recursive(node.right)
        if cache[literal] == nil {
            cache[literal] = 1
        } else {
            cache[literal]! += 1
            if cache[literal]! == 2 { ans.append(node) }
        }

        return literal
    }

}