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

    // Solution @ Sergey Leschev, Belarusian State University

    // 449. Serialize and Deserialize BST
    // Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
    // Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You need to ensure that a binary search tree can be serialized to a string, and this string can be deserialized to the original tree structure.
    // The encoded string should be as compact as possible.

    // Serializes binary search tree.

    // - Parameter root: The binary search tree root.
    // - Returns: Serialized data.

    // Example 1:
    // Input: root = [2,1,3]
    // Output: [2,1,3]

    // Example 2:
    // Input: root = []
    // Output: []

    // Constraints:
    // The number of nodes in the tree is in the range [0, 10^4].
    // 0 <= Node.val <= 10^4
    // The input tree is guaranteed to be a binary search tree.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.

    func serialize(_ root: TreeNode?) -> String {
        var ans = ""
        serialize(root, &ans)
        return ans
    }


    private func serialize(_ root: TreeNode?, _ ans: inout String) {
        guard let root = root else { return }

        ans = "\(ans)\(root.val),"
        serialize(root.left, &ans)
        serialize(root.right, &ans)
    }


    // Deserializes binary search tree.
    // - Parameter data: Serialized data.
    // - Returns: The binary search tree root.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the tree.
    //   - space: O(n), where n is the number of nodes in the tree.
    
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        var queue = data.split(separator: ",").map { String($0) }
        return deserialize(&queue, Int.min, Int.max)
    }


    private func deserialize(_ queue: inout [String], _ lower: Int, _ upper: Int) -> TreeNode? {
        guard !queue.isEmpty else { return nil }

        guard 
            let first = queue.first,
            let val = Int(first),
            lower < val, val < upper
        else { return nil }

        queue.removeFirst()

        var root = TreeNode(val)
        root.left = deserialize(&queue, lower, val)
        root.right = deserialize(&queue, val, upper)
        return root
    }

}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/