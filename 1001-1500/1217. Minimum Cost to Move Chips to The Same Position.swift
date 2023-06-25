class Solution {

    // Solution @ Sergey Leschev

    // 1217. Minimum Cost to Move Chips to The Same Position
    // We have n chips, where the position of the ith chip is position[i].
    // We need to move all the chips to the same position. In one step, we can change the position of the ith chip from position[i] to:
    // position[i] + 2 or position[i] - 2 with cost = 0.
    // position[i] + 1 or position[i] - 1 with cost = 1.
    // Return the minimum cost needed to move all the chips to the same position.

    // Finds the minimum cost needed to move all the chips to the same position.
    //
    // - Parameter position: The positions of chips.
    // - Returns: The minimum cost needed to move all the chips.

    // Example 1:
    // Input: position = [1,2,3]
    // Output: 1
    // Explanation: First step: Move the chip at position 3 to position 1 with cost = 0.
    // Second step: Move the chip at position 2 to position 1 with cost = 1.
    // Total cost is 1.

    // Example 2:
    // Input: position = [2,2,2,3,3]
    // Output: 2
    // Explanation: We can move the two chips at position  3 to position 2. Each move has cost = 1. The total cost = 2.

    // Example 3:
    // Input: position = [1,1000000000]
    // Output: 1

    // Constraints:
    // 1 <= position.length <= 100
    // 1 <= position[i] <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the number of chips.
    //   - space: O(1), only constant space is used.
    
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var even = 0
        var odd = 0

        for pos in position {
            if pos % 2 == 0 { even += 1 } else { odd += 1 }
        }

        return min(odd, even)
    }

}