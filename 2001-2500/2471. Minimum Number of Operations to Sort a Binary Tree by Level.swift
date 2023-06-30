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

    // Solution by Sergey Leschev
    // 2471. Minimum Number of Operations to Sort a Binary Tree by Level

    func minimumOperations(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var nodes = [root]
        var count = 0
        
        func perm(_ arr: [Int]) -> Int {
            var pos = [Int: Int]()
            for (j, m) in arr.sorted().enumerated() {
                pos[m] = j
            }
            
            var vis = [Int](repeating: 0, count: arr.count)
            var tot = 0
            
            for i in 0..<arr.count {
                var cnt = 0
                var curr = i
                
                while vis[curr] == 0 && curr != pos[arr[curr]]! {
                    vis[curr] = 1
                    curr = pos[arr[curr]]!
                    cnt += 1
                }
                
                tot += max(0, cnt - 1)
            }
            
            return tot
        }
        
        while !nodes.isEmpty {
            var vals = [Int]()
            
            for _ in 0..<nodes.count {
                let node = nodes.removeFirst()
                vals.append(node.val)
                
                if let left = node.left {
                    nodes.append(left)
                }
                
                if let right = node.right {
                    nodes.append(right)
                }
            }
            
            count += perm(vals)
        }
        
        return count
    }
}
