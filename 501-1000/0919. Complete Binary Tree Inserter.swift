/*
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

class CBTInserter {

    // Solution @ Sergey Leschev, Belarusian State University

    // 919. Complete Binary Tree Inserter
    // A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.
    // Write a data structure CBTInserter that is initialized with a complete binary tree and supports the following operations:
    // CBTInserter(TreeNode root) initializes the data structure on a given tree with head node root;
    // CBTInserter.insert(int v) will insert a TreeNode into the tree with value node.val = v so that the tree remains complete, and returns the value of the parent of the inserted TreeNode;
    // CBTInserter.get_root() will return the head node of the tree.

    // Example 1:
    // Input: inputs = ["CBTInserter","insert","get_root"], inputs = [[[1]],[2],[]]
    // Output: [null,1,[1,2]]

    // Example 2:
    // Input: inputs = ["CBTInserter","insert","insert","get_root"], inputs = [[[1,2,3,4,5,6]],[7],[8],[]]
    // Output: [null,3,4,[1,2,3,4,5,6,7,8]]

    // Note:
    // The initial given tree is complete and contains between 1 and 1000 nodes.
    // CBTInserter.insert is called at most 10000 times per test case.
    // Every value of a given or inserted node is between 0 and 5000.

    // Trivial breadth-first traversal.

    private var deque: [TreeNode]
    private let root: TreeNode
    private var cur = TreeNode(0)


    init(_ root: TreeNode?) {
        self.root = root!
        self.deque = [self.root]
        
        while !deque.isEmpty {
            cur = deque.removeFirst()
            if (cur.left != nil) {
                deque.append(cur.left!)
            } else {
                break
            }
            
            if (cur.right != nil) {
                deque.append(cur.right!)
            } else {
                break
            }
        }
    }
    

    func insert(_ v: Int) -> Int {
        defer {
            if (cur.left == nil) {
                cur.left = TreeNode(v)
                deque.append(cur.left!)
            } else {
                cur.right = TreeNode(v)
                deque.append(cur.right!)
                cur = deque.removeFirst()
            }
        }
        
        return cur.val
    }
    

    func get_root() -> TreeNode? { root }
}

/**
 * Your CBTInserter object will be instantiated and called as such:
 * let obj = CBTInserter(root)
 * let ret_1: Int = obj.insert(v)
 * let ret_2: TreeNode? = obj.get_root()
**/ 