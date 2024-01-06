class Solution {

    // Solution by Sergey Leschev
    // 2932. Maximum Strong Pair XOR I

    // Time complexity: O(n^2)
    // Space complexity: O(1)

    func maximumStrongPairXor(_ nums: [Int]) -> Int {
        var ans = 0

        // Iterate through each pair of numbers in the array.
        for x in nums {
            for y in nums {
                // Check if the pair (x, y) is a strong pair.
                if abs(x - y) <= min(x, y) {
                    // Update the maximum XOR value.
                    ans = max(ans, x ^ y)
                }
            }
        }

        // Return the maximum XOR value of strong pairs.
        return ans
    }
}
