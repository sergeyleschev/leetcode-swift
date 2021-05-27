/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {

    // 297. Serialize and Deserialize Binary Tree
    // Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
    // Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
    // Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

    // Example 1:
    // Input: root = [1,2,3,null,null,4,5]
    // Output: [1,2,3,null,null,4,5]

    // Example 2:
    // Input: root = []
    // Output: []

    // Example 3:
    // Input: root = [1]
    // Output: [1]

    // Example 4:
    // Input: root = [1,2]
    // Output: [1,2]

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // -1000 <= Node.val <= 1000

    func serialize(_ root: TreeNode?) -> String {
        var ans = ""
        guard root != nil else { return ans }
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node != nil{
                ans += String(node!.val) + ","
                queue.append(node!.left)
                queue.append(node!.right)
            } else {
                ans += "#,"
            }
        }
        
        return ans
    }
    
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.split(separator: ",")
        guard !arr.isEmpty else { return nil }
        
        let root = TreeNode(Int(String(arr[0]))!)
        var queue = [TreeNode]()
        queue.append(root)
        var index = 0, leftNode = true
        
        for i in 1..<arr.count{
            
            if String(arr[i]) != "#" {
                let node: TreeNode = TreeNode(Int(String(arr[i]))!)
                if leftNode {
                    queue[index].left = node
                } else {
                    queue[index].right = node
                }
                queue.append(node)
            }
            
            if !leftNode { index += 1 }
            leftNode = !leftNode
        }
        
        return root
    }

}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))