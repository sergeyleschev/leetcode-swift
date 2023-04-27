/**
 * Definition for a QuadTree node.
 * public class Node {
 *     public var val: Bool
 *     public var isLeaf: Bool
 *     public var topLeft: Node?
 *     public var topRight: Node?
 *     public var bottomLeft: Node?
 *     public var bottomRight: Node?
 *     public init(_ val: Bool, _ isLeaf: Bool) {
 *         self.val = val
 *         self.isLeaf = isLeaf
 *         self.topLeft = nil
 *         self.topRight = nil
 *         self.bottomLeft = nil
 *         self.bottomRight = nil
 *     }
 * }
 */

class Solution {

    // Solution @ Sergey Leschev

    func construct(_ grid: [[Int]]) -> Node? {
        let N = grid.count
        if N == 1 {
            return Node(grid[0][0] == 1, true)
        }
        let topLeftSum = (0..<N/2).flatMap { i in (0..<N/2).map { j in grid[i][j] } }.reduce(0, +)
        let topRightSum = (0..<N/2).flatMap { i in (N/2..<N).map { j in grid[i][j] } }.reduce(0, +)
        let bottomLeftSum = (N/2..<N).flatMap { i in (0..<N/2).map { j in grid[i][j] } }.reduce(0, +)
        let bottomRightSum = (N/2..<N).flatMap { i in (N/2..<N).map { j in grid[i][j] } }.reduce(0, +)
        let node = Node(false, false)
        if topLeftSum == topRightSum && topRightSum == bottomLeftSum && bottomLeftSum == bottomRightSum {
            if topLeftSum == 0 {
                node.isLeaf = true
                node.val = false
            } else if topLeftSum == (N / 2) * (N / 2) {
                node.isLeaf = true
                node.val = true
            }
        }
        if node.isLeaf {
            return node
        }
        node.val = true
        node.topLeft = self.construct((0..<N/2).map { i in (0..<N/2).map { j in grid[i][j] } })
        node.topRight = self.construct((0..<N/2).map { i in (N/2..<N).map { j in grid[i][j] } })
        node.bottomLeft = self.construct((N/2..<N).map { i in (0..<N/2).map { j in grid[i][j] } })
        node.bottomRight = self.construct((N/2..<N).map { i in (N/2..<N).map { j in grid[i][j] } })
        return node
    }
}
