class Solution {

    // Solution @ Sergey Leschev

    // 1743. Restore the Array From Adjacent Pairs
    // There is an integer array nums that consists of n unique elements, but you have forgotten it. However, you do remember every pair of adjacent elements in nums.
    // You are given a 2D integer array adjacentPairs of size n - 1 where each adjacentPairs[i] = [ui, vi] indicates that the elements ui and vi are adjacent in nums.
    // It is guaranteed that every adjacent pair of elements nums[i] and nums[i+1] will exist in adjacentPairs, either as [nums[i], nums[i+1]] or [nums[i+1], nums[i]]. The pairs can appear in any order.

    // Return the original array nums. If there are multiple solutions, return any of them.

    // Example 1:
    // Input: adjacentPairs = [[2,1],[3,4],[3,2]]
    // Output: [1,2,3,4]
    // Explanation: This array has all its adjacent pairs in adjacentPairs.
    // Notice that adjacentPairs[i] may not be in left-to-right order.

    // Example 2:
    // Input: adjacentPairs = [[4,-2],[1,4],[-3,1]]
    // Output: [-2,4,1,-3]
    // Explanation: There can be negative numbers.
    // Another solution is [-3,1,4,-2], which would also be accepted.

    // Example 3:
    // Input: adjacentPairs = [[100000,-100000]]
    // Output: [100000,-100000]

    // Constraints:
    // nums.length == n
    // adjacentPairs.length == n - 1
    // adjacentPairs[i].length == 2
    // 2 <= n <= 10^5
    // -10^5 <= nums[i], ui, vi <= 10^5
    // There exists some nums that has adjacentPairs as its pairs.

    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        guard adjacentPairs.count > 1 else { return adjacentPairs[0] }
        let n = adjacentPairs.count + 1
        var ans = [Int]()
        var map = [Int: [Int]]()
        for ap in adjacentPairs {
            map[ap[0],default: []].append(ap[1])
            map[ap[1],default: []].append(ap[0])
        }
        var visited = Set<Int>()
        
        for (v,neighbors) in map {
            if neighbors.count == 1 {
                ans.append(v)
                ans.append(neighbors[0])
                visited.insert(v)
                visited.insert(neighbors[0])
                break
            }
        }

        while ans.count < n {
            if let last = ans.last, let neighbors = map[last] {
                neighbors.forEach { (v) in
                    if !visited.contains(v) {
                        ans.append(v)
                        visited.insert(v)
                    }
                }
            }
        }
        return ans
    }
}