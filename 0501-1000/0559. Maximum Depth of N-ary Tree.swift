/// Definition for a Node.
/// public class Node {
///     public var val: Int
///     public var children: [Node]
///     public init(_ val: Int) {
///         self.val = val
///         self.children = []
///     }
/// }
class Solution {

    // Solution by Sergey Leschev

    // 559. Maximum Depth of N-ary Tree
    // Given a n-ary tree, find its maximum depth.
    // The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
    // Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

    // Example 1:
    // Input: root = [1,null,3,2,4,null,5,6]
    // Output: 3

    // Example 2:
    // Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
    // Output: 5

    // Constraints:
    // The depth of the n-ary tree is less than or equal to 1000.
    // The total number of nodes is between [0, 10^4].

    private class NodeDepth {
        let node: Node
        let depth: Int

        init(_ node: Node, _ depth: Int) {
            self.node = node
            self.depth = depth
        }
    }

    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        let rootND = NodeDepth(root, 1)
        var output: Int = 1
        var stack = [NodeDepth]()

        stack.append(rootND)
        while !stack.isEmpty {
            let current = stack.removeLast()
            let node = current.node
            let depth = current.depth
            let children = node.children

            output = max(output, depth)
            if children.count > 0 {
                for child in children {
                    let nd = NodeDepth(child, depth + 1)
                    stack.append(nd)
                }
            }
        }

        return output
    }

}
