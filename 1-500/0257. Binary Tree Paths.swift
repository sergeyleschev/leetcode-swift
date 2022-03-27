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

    // 257. Binary Tree Paths
    // Given the root of a binary tree, return all root-to-leaf paths in any order.
    // A leaf is a node with no children.

    // Finds all root-to-leaf paths.

    // - Parameter root: Binary root tree.
    // - Returns: All root-to-leaf paths.

    // Example 1:
    // Input: root = [1,2,3,null,5]
    // Output: ["1->2->5","1->3"]

    // Example 2:
    // Input: root = [1]
    // Output: ["1"]

    // Constraints:
    // The number of nodes in the tree is in the range [1, 100].
    // -100 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.

    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans = [String]()

        dfs(root, path: "", ans: &ans)
        return ans
    }
    

    private func dfs(_ node: TreeNode?, path: String, ans: inout [String]) {
        guard let node = node else { return }
        
        let path = "\(path)\(node.val)"
        if node.left == nil, node.right == nil {
            ans.append(path)
            
        } else {
            dfs(node.left, path: "\(path)->", ans: &ans)
            dfs(node.right, path: "\(path)->", ans: &ans)
        }
    }

}