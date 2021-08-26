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

    // 501. Find Mode in Binary Search Tree
    // Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.
    // If the tree has more than one mode, return them in any order.
    // Assume a BST is defined as follows:
    // The left subtree of a node contains only nodes with keys less than or equal to the node's key.
    // The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
    // Both the left and right subtrees must also be binary search trees.

    // Example 1:
    // Input: root = [1,null,2,2]
    // Output: [2]

    // Example 2:
    // Input: root = [0]
    // Output: [0]

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -10^5 <= Node.val <= 10^5
     
    // Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count)


    func findMode(_ root: TreeNode?) -> [Int] {
        var dict = [Int: Int]()
        
        traverse(root, dict: &dict)
        
        let max = dict.values.max() ?? 0
        var res = [Int]()
        
        for (key, value) in dict {
            if value == max { res.append(key) }
        }
        return res
    }
    
    
    func traverse(_ root: TreeNode?, dict: inout [Int: Int]) {
        guard let tree = root else { return }
        
        dict[tree.val] = (dict[tree.val] ?? 0) + 1
        traverse(tree.left, dict: &dict)
        traverse(tree.right, dict: &dict)
    }

}