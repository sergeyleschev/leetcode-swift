class Solution {

    // Solution by Sergey Leschev

    // 1529. Bulb Switcher IV
    // There is a room with n bulbs, numbered from 0 to n - 1, arranged in a row from left to right. Initially, all the bulbs are turned off.
    // Your task is to obtain the configuration represented by target where target[i] is '1' if the ith bulb is turned on and is '0' if it is turned off.
    // You have a switch to flip the state of the bulb, a flip operation is defined as follows:
    // Choose any bulb (index i) of your current configuration.
    // Flip each bulb from index i to index n - 1.
    // When any bulb is flipped it means that if it is '0' it changes to '1' and if it is '1' it changes to '0'.

    // Return the minimum number of flips required to form target.

    // Example 1:
    // Input: target = "10111"
    // Output: 3
    // Explanation: Initial configuration "00000".
    // flip from the third bulb:  "00000" -> "00111"
    // flip from the first bulb:  "00111" -> "11000"
    // flip from the second bulb:  "11000" -> "10111"
    // We need at least 3 flip operations to form target.

    // Example 2:
    // Input: target = "101"
    // Output: 3
    // Explanation: "000" -> "111" -> "100" -> "101".

    // Example 3:
    // Input: target = "00000"
    // Output: 0

    // Example 4:
    // Input: target = "001011101"
    // Output: 5

    // Constraints:
    // 1 <= target.length <= 10^5
    // target[i] is either '0' or '1'.

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func minFlips(_ target: String) -> Int {
        let targetA = Array(target)
        var dp = Array.init(repeating: Int.max, count: targetA.count + 1)
        
        dp[0] = targetA[0] == "0" ? 0 : 1
        
        for i in 1..<targetA.count {
            if targetA[i] == "0", dp[i - 1] % 2 == 0 {
                dp[i] = dp[i - 1]
            } else if targetA[i] == "1", dp[i - 1] % 2 != 0 {
                dp[i] = dp[i - 1]
            } else {
                dp[i] = dp[i - 1] + 1
            }
        }

        return dp[targetA.count - 1]
    }

}