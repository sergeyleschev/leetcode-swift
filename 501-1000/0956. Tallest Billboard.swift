class Solution {

    // Solution @ Sergey Leschev
    // 956. Tallest Billboard

    // Approach
    // The code uses dynamic programming to solve the problem. It maintains a dictionary dp, where the keys represent the possible height differences between the two billboards, and the values represent the maximum sum of heights achieved for each height difference.

    // The code iterates through each rod in the given input rods. For each rod i, it creates a new dictionary cur to store the updated values for dp. Then, it iterates through the existing entries in dp and updates the values in cur based on three cases:
    
    // 1. Adding the current rod i to the same height difference: cur[sum + i] = max(dp[sum]! + i, cur[sum + i, default: 0])
    // 2. Keeping the same height difference: cur[sum] = max(dp[sum]!, cur[sum, default: 0])
    // 3. Subtracting the current rod i from the height difference: cur[sum - i] = max(dp[sum]!, cur[sum - i, default: 0])
    
    // After iterating through all the rods, the final result is obtained from dp[0], which represents the maximum possible sum of heights for a height difference of 0 (i.e., the two billboards have equal heights).

    // Complexity
    // - Time complexity: O(n^2).
    // - Space complexity: O(n).
    // The code uses a dictionary dp to store the maximum sums of heights for each height difference. The size of the dictionary grows as the number of rods increases, so the space complexity is also O(n), where n is the number of rods.

    func tallestBillboard(_ rods: [Int]) -> Int {
        var dp = [0: 0]
        
        for i in rods {
            var cur = [Int: Int]()
            for (sum, height) in dp {
                cur[sum + i] = max(dp[sum]! + i, cur[sum + i, default: 0])
                cur[sum] = max(dp[sum]!, cur[sum, default: 0])
                cur[sum - i] = max(dp[sum]!, cur[sum - i, default: 0])
            }
            dp = cur
        }
        
        return dp[0, default: 0]
    }
}
