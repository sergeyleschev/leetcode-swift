class Solution {

    // Solution by Sergey Leschev

    // 1040. Moving Stones Until Consecutive II
    // On an infinite number line, the position of the i-th stone is given by stones[i].  Call a stone an endpoint stone if it has the smallest or largest position.
    // Each turn, you pick up an endpoint stone and move it to an unoccupied position so that it is no longer an endpoint stone.
    // In particular, if the stones are at say, stones = [1,2,5], you cannot move the endpoint stone at position 5, since moving it to any position (such as 0, or 3) will still keep that stone as an endpoint stone.
    // The game ends when you cannot make any more moves, ie. the stones are in consecutive positions.
    // When the game ends, what is the minimum and maximum number of moves that you could have made?  Return the answer as an length 2 array: answer = [minimum_moves, maximum_moves]

    // Example 1:
    // Input: [7,4,9]
    // Output: [1,2]
    // Explanation: 
    // We can move 4 -> 8 for one move to finish the game.
    // Or, we can move 9 -> 5, 4 -> 6 for two moves to finish the game.

    // Example 2:
    // Input: [6,5,4,3,10]
    // Output: [2,3]
    // We can move 3 -> 8 then 10 -> 7 to finish the game.
    // Or, we can move 3 -> 7, 4 -> 8, 5 -> 9 to finish the game.
    // Notice we cannot move 10 -> 2 to finish the game, because that would be an illegal move.

    // Example 3:
    // Input: [100,101,104,102,103]
    // Output: [0,0]

    // Note:
    // 3 <= stones.length <= 10^4
    // 1 <= stones[i] <= 10^9
    // stones[i] have distinct values.

    func numMovesStonesII(_ stones: [Int]) -> [Int] {
        if stones.count <= 2 { return [0, 0] }
        var stones = stones
        let n = stones.count
        
        stones.sort() // Make stones ascending
        var maxValue = stones[n - 1] - stones[0] + 1 - n
        maxValue -= min(stones[n - 1] - stones[n - 2] - 1, stones[1] - stones[0] - 1)
        var minValue = maxValue
        var i = 0
        var j = 0

        while i < n {
            while j + 1 < n && stones[j + 1] - stones[i] + 1 <= n { j += 1 }
            var cost = n - (j - i + 1)
            if j - i + 1 == n-1 && stones[j] - stones[i] + 1 == n - 1 { cost = 2 }
            minValue = min(minValue, cost)
            i += 1
        }
        
        return [minValue, maxValue]
    }

}