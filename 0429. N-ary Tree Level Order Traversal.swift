/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {

    // 429. N-ary Tree Level Order Traversal
    // Given an n-ary tree, return the level order traversal of its nodes' values.
    // Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

    // Example 1:
    // Input: root = [1,null,3,2,4,null,5,6]
    // Output: [[1],[3,2,4],[5,6]]

    // Example 2:
    // Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
    // Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]

    // Constraints:
    // The height of the n-ary tree is less than or equal to 1000
    // The total number of nodes is between [0, 10^4]

    func levelOrder(_ root: Node?) -> [[Int]] {
        var result = [[Int]]()
        guard let rootNode = root else { return result }
        
        var stack = [Node]()
        stack.append(rootNode)
        
        while !stack.isEmpty {
            var rowArray = [Int]()

            // count of stack is frozen at the time when iteration of for-loop starts
            for _ in 0..<stack.count {
                let dequedNode = stack.removeFirst()
                rowArray.append(dequedNode.val)
                
                for child in dequedNode.children {
                    stack.append(child)
                }
            }
            result.append(rowArray)
        }
        
        return result
    }

}