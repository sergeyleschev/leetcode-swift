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

class BSTIterator {

    // Solution @ Sergey Leschev, Belarusian State University

    // 173. Binary Search Tree Iterator
    // Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):

    // BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
    // boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
    // int next() Moves the pointer to the right, then returns the number at the pointer.
    // Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.

    // You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.

    // Example 1:
    // Input
    // ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
    // [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
    // Output
    // [null, 3, 7, true, 9, true, 15, true, 20, false]
    // Explanation
    // BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
    // bSTIterator.next();    // return 3
    // bSTIterator.next();    // return 7
    // bSTIterator.hasNext(); // return True
    // bSTIterator.next();    // return 9
    // bSTIterator.hasNext(); // return True
    // bSTIterator.next();    // return 15
    // bSTIterator.hasNext(); // return True
    // bSTIterator.next();    // return 20
    // bSTIterator.hasNext(); // return False

    // Constraints:
    // The number of nodes in the tree is in the range [1, 10^5].
    // 0 <= Node.val <= 10^6
    // At most 10^5 calls will be made to hasNext, and next.

    // Follow up:
    // Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?


    private var stack: [TreeNode]
    
    // Initialization of data structures.
    // - Parameter root: Binary tree root.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), where n is the number of nodes in the binary tree.

    init(_ root: TreeNode?) {
        stack = [TreeNode]()
        leftMostInorder(root)
    }
    
    private func leftMostInorder(_ root: TreeNode?) {
        var root = root
        while let node = root {
            stack.append(node)
            root = root?.left
        }
    }
    
    // Finds the next element.
    // - Returns: The next element.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(n), only constant space is used.

    func next() -> Int {
        let topMost = stack.removeLast()
        leftMostInorder(topMost.right)
        return topMost.val
    }
    
    // Finds if the next element exists.
    // - Returns: True if the next element exists, otherwise returns false.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func hasNext() -> Bool {
        !stack.isEmpty
    }
    
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */