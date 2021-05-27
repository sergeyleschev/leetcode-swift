class Solution {

    // 258. Add Digits
    // Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

    // Repeatedly add all digits until the result has only one digit.
    // - Parameter num: A non-negative integer.
    // - Returns: Sum of all digits until the result has only one digit.

    // Example 1:
    // Input: num = 38
    // Output: 2
    // Explanation: The process is
    // 38 --> 3 + 8 --> 11
    // 11 --> 1 + 1 --> 2 
    // Since 2 has only one digit, return it.

    // Example 2:
    // Input: num = 0
    // Output: 0
     
    // Constraints:
    // 0 <= num <= 2^31 - 1 

    // Follow up: Could you do it without any loop/recursion in O(1) runtime?

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func addDigits(_ num: Int) -> Int {
        return num == 0 ? 0 : 1 + (num - 1) % 9
    }

}