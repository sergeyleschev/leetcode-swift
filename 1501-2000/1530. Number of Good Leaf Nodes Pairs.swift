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

    // Solution @ Sergey Leschev

    // 1530. Number of Good Leaf Nodes Pairs
    // Given the root of a binary tree and an integer distance. A pair of two different leaf nodes of a binary tree is said to be good if the length of the shortest path between them is less than or equal to distance.

    // Return the number of good leaf node pairs in the tree.

    // Example 1:
    // Input: root = [1,2,3,null,4], distance = 3
    // Output: 1
    // Explanation: The leaf nodes of the tree are 3 and 4 and the length of the shortest path between them is 3. This is the only good pair.

    // Example 2:
    // Input: root = [1,2,3,4,5,6,7], distance = 3
    // Output: 2
    // Explanation: The good pairs are [4,5] and [6,7] with shortest path = 2. The pair [4,6] is not good because the length of ther shortest path between them is 4.

    // Example 3:
    // Input: root = [7,1,4,6,null,5,3,null,null,null,null,null,2], distance = 3
    // Output: 1
    // Explanation: The only good pair is [2,5].

    // Example 4:
    // Input: root = [100], distance = 1
    // Output: 0

    // Example 5:
    // Input: root = [1,1,1], distance = 2
    // Output: 1

    // Constraints:
    // The number of nodes in the tree is in the range [1, 2^10].
    // Each node's value is between [1, 100].
    // 1 <= distance <= 10

    var result = 0


    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        dfs(root, distance)
        return result
    }
    

    func dfs(_ node: TreeNode?, _ distance: Int) -> [Int: Int] { // (distance, count of leaf nodes)
        guard let node = node else { return [0: 0] }
        if node.left == nil, node.right == nil { return [0: 1] } // leaf ndoe
        let l = dfs(node.left, distance)
        let r = dfs(node.right, distance)
        var dict = [Int: Int]()

        for (dLeft, countLeft) in l {
            for (dRight, countRight) in r where dLeft + dRight + 2 <= distance {
                result += (countLeft * countRight)
            }
        }

        for d in 0..<distance {
            let lc = l[d] ?? 0
            let rc = r[d] ?? 0
            dict[d + 1] = lc + rc
        }

        return dict
    }

}