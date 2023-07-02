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

    // 968. Binary Tree Cameras
    // You are given the root of a binary tree. We install cameras on the tree nodes where each camera at a node can monitor its parent, itself, and its immediate children.
    // Return the minimum number of cameras needed to monitor all nodes of the tree.

    // Example 1:
    // Input: root = [0,0,null,0,0]
    // Output: 1
    // Explanation: One camera is enough to monitor all nodes if placed as shown.

    // Example 2:
    // Input: root = [0,0,null,0,null,0,null,null,0]
    // Output: 2
    // Explanation: At least two cameras are needed to monitor all nodes of the tree. The above image shows one of the valid configurations of camera placement.

    // Constraints:
    // The number of nodes in the tree is in the range [1, 1000].
    // Node.val == 0

    func minCameraCover(_ root: TreeNode?) -> Int {
        var state = solve(root)
        return min(state[1], state[2])
    }

    // state0: Strict subtree: All the nodes below this node are covered, but not this node.
    // state1: Normal subtree: All the nodes below and including this node are covered, but there is no camera here.
    // state2: Placed camera: All the nodes below and including this node are covered, and there is a camera here (which may cover nodes above this node).
    // return [state0, state1, state2]
    func solve(_ node: TreeNode?) -> [Int] {
        guard let node = node else { return [0, 0, 10000] }

        let left = solve(node.left)
        let right = solve(node.right)

        let minLeft12 = min(left[1], left[2])
        let minRight12 = min(right[1], right[2])

        let s0 = left[1] + right[1]
        let s1 = min(left[2] + minRight12, right[2] + minLeft12)
        let s2 = 1 + min(left[0], minLeft12) + min(right[0], minRight12)
        return [s0, s1, s2]
    }

}
