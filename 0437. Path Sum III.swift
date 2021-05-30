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

    // 437. Path Sum III
    // Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.
    // The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

    // Finds the number of paths that sum to a given value.

    // - Parameters:
    //   - root: Binary tree root.
    //   - sum: The given value.
    // - Returns: The number of paths.

    // Example 1:
    // Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
    // Output: 3
    // Explanation: The paths that sum to 8 are shown.

    // Example 2:
    // Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
    // Output: 3

    // Constraints:
    // The number of nodes in the tree is in the range [0, 1000].
    // -10^9 <= Node.val <= 10^9
    // -1000 <= targetSum <= 1000

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(n), where n is the number of nodes.
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var dict = [Int: Int]()
        dict[0] = 1
        return pathSum(root, 0, sum, &dict)
    }


    private func pathSum(_ root: TreeNode?, _ currSum: Int, _ target: Int, _ dict: inout [Int: Int]) -> Int {
        guard let root = root else { return 0 }

        let currSum = currSum + root.val
        var ans = dict[currSum - target] ?? 0

        dict[currSum, default: 0] += 1
        ans += pathSum(root.left, currSum, target, &dict)
        ans += pathSum(root.right, currSum, target, &dict)
        dict[currSum, default: 0] -= 1

        return ans
    }

}