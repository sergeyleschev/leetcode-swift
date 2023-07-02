/// Definition for a binary tree node.
/// public class TreeNode {
///     public var val: Int
///     public var left: TreeNode?
///     public var right: TreeNode?
///     public init() { self.val = 0; self.left = nil; self.right = nil; }
///     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
///     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
///         self.val = val
///         self.left = left
///         self.right = right
///     }
/// }
class Solution {

    // Solution by Sergey Leschev

    // 1382. Balance a Binary Search Tree
    // Given a binary search tree, return a balanced binary search tree with the same node values.
    // A binary search tree is balanced if and only if the depth of the two subtrees of every node never differ by more than 1.
    // If there is more than one answer, return any of them.

    // Example 1:
    // Input: root = [1,null,2,null,3,null,4,null,null]
    // Output: [2,1,3,null,null,null,4]
    // Explanation: This is not the only correct answer, [3,1,4,null,2,null,null] is also correct.

    // Constraints:
    // The number of nodes in the tree is between 1 and 10^4.
    // The tree nodes will have distinct values between 1 and 10^5.

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var valList: [Int] = []

        getTreeList(root, &valList)
        return buildTree(valList, 0, valList.count - 1)
    }

    func getTreeList(_ root: TreeNode?, _ valList: inout [Int]) {
        guard let root = root else { return }

        getTreeList(root.left, &valList)
        valList.append(root.val)
        getTreeList(root.right, &valList)
    }

    func buildTree(_ valList: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        let mid = (right - left) / 2 + left
        let tree = TreeNode(valList[mid])

        tree.left = buildTree(valList, left, mid - 1)
        tree.right = buildTree(valList, mid + 1, right)

        return tree
    }

}
