class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1840. Maximum Building Height
    // You want to build n new buildings in a city. The new buildings will be built in a line and are labeled from 1 to n.
    // However, there are city restrictions on the heights of the new buildings:
    // The height of each building must be a non-negative integer.
    // The height of the first building must be 0.
    // The height difference between any two adjacent buildings cannot exceed 1.
    // Additionally, there are city restrictions on the maximum height of specific buildings. These restrictions are given as a 2D integer array restrictions where restrictions[i] = [idi, maxHeighti] indicates that building idi must have a height less than or equal to maxHeighti.
    // It is guaranteed that each building will appear at most once in restrictions, and building 1 will not be in restrictions.

    // Return the maximum possible height of the tallest building.

    // Example 1:
    // Input: n = 5, restrictions = [[2,1],[4,1]]
    // Output: 2
    // Explanation: The green area in the image indicates the maximum allowed height for each building.
    // We can build the buildings with heights [0,1,2,1,2], and the tallest building has a height of 2.

    // Example 2:
    // Input: n = 6, restrictions = []
    // Output: 5
    // Explanation: The green area in the image indicates the maximum allowed height for each building.
    // We can build the buildings with heights [0,1,2,3,4,5], and the tallest building has a height of 5.

    // Example 3:
    // Input: n = 10, restrictions = [[5,3],[2,5],[7,4],[10,3]]
    // Output: 5
    // Explanation: The green area in the image indicates the maximum allowed height for each building.
    // We can build the buildings with heights [0,1,2,3,3,4,4,5,4,3], and the tallest building has a height of 5.

    // Constraints:
    // 2 <= n <= 10^9
    // 0 <= restrictions.length <= min(n - 1, 10^5)
    // 2 <= idi <= n
    // idi is unique.
    // 0 <= maxHeighti <= 10^9

    // Solution: 2 pointer
    // think simple scenario first, height can be either
    // bounded by 2 sides
    // bounded only by 1 side

    // we can get maxHeight of this in O(1) time
    // However, there can be lots of restrictions on both sides
    // and sometimes the adjacent restrictions are not the tightest bound.

    // We solve this issue by
    // first "propagating" restrictions from left to right and then from right to right.
    // ex: n = 8, restrictions = [[2,1], [5,5], [7,1]]
    // first propogate from left to right to tighten the restriction [5,5] to [5,4] then right to left

    // - Complexity:
    //   - time: O(size log size)
    //   - space: O(size)

    func maxBuilding(_ n: Int, _ restrictions: [[Int]]) -> Int {
        var restrictions = restrictions.sorted(by: { $0[0] < $1[0] })
        var maxHeight = 0
        restrictions.insert([1, 0], at: 0)
        restrictions.append([n, n - 1])
        let size = restrictions.count

        for i in 1..<size {
            restrictions[i][1] = min(restrictions[i][1], restrictions[i - 1][1] + restrictions[i][0] - restrictions[i - 1][0])
        }

        for i in stride(from: size - 2, through: 0, by: -1) {
            restrictions[i][1] = min(restrictions[i][1], restrictions[i + 1][1] + restrictions[i + 1][0] - restrictions[i][0])
        }

        for i in 1..<size {
            var left = restrictions[i - 1][0]
            var leftHeight = restrictions[i - 1][1]

            var right = restrictions[i][0]
            var rightHeight = restrictions[i][1]

            let diff = abs(leftHeight - rightHeight)
            if right - left < diff {
                maxHeight = max(maxHeight, min(leftHeight, rightHeight) + right - left)
            } else {
                maxHeight = max(maxHeight, max(leftHeight, rightHeight) + (right - left - diff) / 2)
            }
        }

        return maxHeight
    }

}