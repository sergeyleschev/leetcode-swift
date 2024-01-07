class Solution {

    // Solution by Sergey Leschev
    // 2952. Minimum Number of Coins to be Added

    // Time complexity : O(N log N)
    // Space complexity: O(1)

    func minimumAddedCoins(_ coins: [Int], _ target: Int) -> Int {
        var coins = coins.sorted()
        var currentMax = 0
        var additions = 0
        var index = 0

        while currentMax < target {
            if index < coins.count && coins[index] <= currentMax + 1 {
                currentMax += coins[index]
                index += 1
            } else {
                currentMax += currentMax + 1
                additions += 1
            }
        }

        return additions
    }
}
