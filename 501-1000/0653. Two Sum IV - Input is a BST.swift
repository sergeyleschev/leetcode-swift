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

    // 653. Two Sum IV - Input is a BST
    // Given the root of a Binary Search Tree and a target number k, return true if there exist two elements in the BST such that their sum is equal to the given target.

    // Example 1:
    // Input: root = [5,3,6,2,4,null,7], k = 9
    // Output: true

    // Example 2:
    // Input: root = [5,3,6,2,4,null,7], k = 28
    // Output: false

    // Example 3:
    // Input: root = [2,1,3], k = 4
    // Output: true

    // Example 4:
    // Input: root = [2,1,3], k = 1
    // Output: false

    // Example 5:
    // Input: root = [2,1,3], k = 3
    // Output: true

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -10^4 <= Node.val <= 10^4
    // root is guaranteed to be a valid binary search tree.
    // -10^5 <= k <= 10^5

    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var array = Array<Int>()
        var i = 0
        

        func traversalTree(_ root: TreeNode?) {
            guard let root = root else { return }
            traversalTree(root.left)
            array.append(root.val)
            traversalTree(root.right)
        }
        
        traversalTree(root)
        
        var j = array.count - 1

        while i < j {
            if array[i] + array[j] == k {
                return true
            } else if array[i] + array[j] < k {
                i += 1
            } else {
                j -= 1
            }
        }
        
        return false
    }

}