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

    // 508. Most Frequent Subtree Sum
    // Given the root of a binary tree, return the most frequent subtree sum. If there is a tie, return all the values with the highest frequency in any order.
    // The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself).

    // Example 1:
    // Input: root = [5,2,-3]
    // Output: [2,-3,4]

    // Example 2:
    // Input: root = [5,2,-5]
    // Output: [2]

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^4].
    // -10^5 <= Node.val <= 10^5

    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var dic = [Int: Int]()
        var res = [Int]()

        func traversalTree(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let left = traversalTree(root.left)
            let right = traversalTree(root.right)
            let sum = root.val + left + right
            dic[sum] = (dic[sum] ?? 0) + 1
            return sum
        }

        _ = traversalTree(root)

        let max = dic.values.max()
        for (k, _) in dic {
            if dic[k] == max { res.append(k) }
        }

        return res
    }

}
