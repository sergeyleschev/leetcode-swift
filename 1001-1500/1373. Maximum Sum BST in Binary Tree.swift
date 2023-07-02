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

    // 1373. Maximum Sum BST in Binary Tree
    // Given a binary tree root, the task is to return the maximum sum of all keys of any sub-tree which is also a Binary Search Tree (BST).
    // Assume a BST is defined as follows:
    // The left subtree of a node contains only nodes with keys less than the node's key.
    // The right subtree of a node contains only nodes with keys greater than the node's key.
    // Both the left and right subtrees must also be binary search trees.

    // Example 1:
    // Input: root = [1,4,3,2,4,2,5,null,null,null,null,null,null,4,6]
    // Output: 20
    // Explanation: Maximum sum in a valid Binary search tree is obtained in root node with key equal to 3.

    // Example 2:
    // Input: root = [4,3,null,1,2]
    // Output: 2
    // Explanation: Maximum sum in a valid Binary search tree is obtained in a single root node with key equal to 2.

    // Example 3:
    // Input: root = [-4,-2,-5]
    // Output: 0
    // Explanation: All values are negatives. Return an empty BST.

    // Example 4:
    // Input: root = [2,1,3]
    // Output: 6

    // Example 5:
    // Input: root = [5,4,8,3,null,6,3]
    // Output: 7

    // Constraints:
    // The given binary tree will have between 1 and 40000 nodes.
    // Each node's value is between [-4 * 10^4 , 4 * 10^4].

    // Go through every node of tree with DFS.
    // Check on the validation of both left subtree and right subtree while calculating the sum of each subtrees.
    // If both of subtrees are valid and current tree is also valid, compare the maxSum with sum for current tree, rooted from root
    // Otherwise, current tree should contribute nothing for the sum of this tree, which might be the subtree of another node.

    // - Complexity:
    //   - time: O(n), n is the number of nodes in this tree rooted from root

    private var maxSum = 0  // The max sum value of a valid BST or sub BST.

    func maxSumBST(_ root: TreeNode?) -> Int {
        maxSum = 0
        guard let root = root else { return maxSum }

        validBST(root)
        return maxSum
    }

    // - Returns:
    //   - Validation: if subtree rooted from current root is valid
    //   - Minimum: min value of tree rooted from root
    //   - Maximum: max value of tree rooted from root
    //   - Sum: the sum of every TreeNode child, including root

    private func validBST(_ root: TreeNode) -> (Bool, Int, Int, Int) {
        var isValid = true
        var minV = root.val
        var maxV = root.val
        var sum = root.val
        let leftSum: Int
        let rightSum: Int

        if let left = root.left {  // If root has left child
            let (lvalid, lmin, lmax, lsum) = self.validBST(left)
            if lmax >= minV { isValid = false } else { minV = lmin }
            isValid = lvalid && isValid
            leftSum = lvalid ? lsum : 0
        } else {
            leftSum = 0
        }

        if let right = root.right {  // If root has right child
            let (rvalid, rmin, rmax, rsum) = self.validBST(right)
            if rmin <= maxV { isValid = false } else { maxV = rmax }
            isValid = rvalid && isValid
            rightSum = rvalid ? rsum : 0
        } else {
            rightSum = 0
        }

        if isValid {  // If current tree rooted from root is a valid BST
            sum += leftSum + rightSum
            maxSum = max(maxSum, sum)
        } else {
            sum = 0
        }

        return (isValid, minV, maxV, sum)
    }

}
