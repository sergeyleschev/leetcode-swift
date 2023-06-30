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

    // Solution by Sergey Leschev

    // 987. Vertical Order Traversal of a Binary Tree
    // Given the root of a binary tree, calculate the vertical order traversal of the binary tree.
    // For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).
    // The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.
    // Return the vertical order traversal of the binary tree.

    // Returns the vertical order traversal of a binary tree nodes values.

    // - Parameter root: Binary tree root.
    // - Returns: A list of non-empty reports in order of X coordinate.

    // Example 1:
    // Input: root = [3,9,20,null,null,15,7]
    // Output: [[9],[3,15],[20],[7]]
    // Explanation:
    // Column -1: Only node 9 is in this column.
    // Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
    // Column 1: Only node 20 is in this column.
    // Column 2: Only node 7 is in this column.

    // Example 2:
    // Input: root = [1,2,3,4,5,6,7]
    // Output: [[4],[2],[1,5,6],[3],[7]]
    // Explanation:
    // Column -2: Only node 4 is in this column.
    // Column -1: Only node 2 is in this column.
    // Column 0: Nodes 1, 5, and 6 are in this column.
    //           1 is at the top, so it comes first.
    //           5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
    // Column 1: Only node 3 is in this column.
    // Column 2: Only node 7 is in this column.

    // Example 3:
    // Input: root = [1,2,3,4,6,5,7]
    // Output: [[4],[2],[1,5,6],[3],[7]]
    // Explanation:
    // This case is the exact same as example 2, but with nodes 5 and 6 swapped.
    // Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.

    // Constraints:
    // The number of nodes in the tree is in the range [1, 1000].
    // 0 <= Node.val <= 1000

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of nodes.
    //   - space: O(n log(n)), where n is the number of nodes.
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int: [(Int, Int)]]()
        var ans = [[Int]]()

        dfs(root, x: 0, y: 0, dict: &dict)

        for key in dict.keys.sorted() {
            guard let val = dict[key] else { continue }
            let v = val.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 >= $1.0 }
            ans.append(v.map { $0.1 })
        }

        return ans
    }

    
    private func dfs(_ root: TreeNode?, x: Int, y: Int, dict: inout [Int: [(Int, Int)]]) {
        guard let root = root else { return }

        dict[x, default: [(Int, Int)]()].append((y, root.val))
        dfs(root.left, x: x - 1, y: y - 1, dict: &dict)
        dfs(root.right, x: x + 1, y: y - 1, dict: &dict)
    }

}