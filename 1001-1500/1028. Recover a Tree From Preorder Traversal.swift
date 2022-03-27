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

    // 1028. Recover a Tree From Preorder Traversal
    // We run a preorder depth-first search (DFS) on the root of a binary tree.
    // At each node in this traversal, we output D dashes (where D is the depth of this node), then we output the value of this node.  If the depth of a node is D, the depth of its immediate child is D + 1.  The depth of the root node is 0.
    // If a node has only one child, that child is guaranteed to be the left child.
    // Given the output traversal of this traversal, recover the tree and return its root.

    // Example 1:
    // Input: traversal = "1-2--3--4-5--6--7"
    // Output: [1,2,5,3,4,6,7]

    // Example 2:
    // Input: traversal = "1-2--3---4-5--6---7"
    // Output: [1,2,5,3,null,6,null,4,null,7]

    // Example 3:
    // Input: traversal = "1-401--349---90--88"
    // Output: [1,401,null,349,88,90]

    // Constraints:
    // The number of nodes in the original tree is in the range [1, 1000].
    // 1 <= Node.val <= 10^9

    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var s = Array(S.map { String($0) })
        var stack: [TreeNode] = []
        var index = 0

        while index < s.count {
            var level = 0
            var num = 0

            while index < s.count, s[index] == "-" {
                level += 1
                index += 1
            }

            while index < s.count, s[index] != "-" {
                num = num * 10 + Int(s[index])!
                index += 1
            }
            
            while stack.count > level { stack.removeLast() }
            
            let node = TreeNode(num)
            if let last = stack.last {
                if last.left == nil {
                    last.left = node
                } else {
                    last.right = node
                }
            }
            stack.append(node)
        }
        
        return stack.first
    }
    
}