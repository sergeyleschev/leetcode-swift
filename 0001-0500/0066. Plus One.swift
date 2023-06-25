class Solution {

    // Solution @ Sergey Leschev

    // 66. Plus One
    // Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.
    // The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
    // You may assume the integer does not contain any leading zero, except the number 0 itself.

    // Adds one to an integer that is represented as an array.

    // - Parameter digits: A non-empty array of digits representing a non-negative integer.
    // - Returns: Given integer plus one represented as an array.

    // Example 1:
    // Input: digits = [1,2,3]
    // Output: [1,2,4]
    // Explanation: The array represents the integer 123.

    // Example 2:
    // Input: digits = [4,3,2,1]
    // Output: [4,3,2,2]
    // Explanation: The array represents the integer 4321.

    // Example 3:
    // Input: digits = [0]
    // Output: [1]
     
    // Constraints:
    // 1 <= digits.length <= 100
    // 0 <= digits[i] <= 9

    // - Complexity:
    //   - time: O(n), where n is the length of the digits.
    //   - space: O(n), where n is the length of the digits.

    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits

        for i in (0..<digits.count).reversed() {
            guard digits[i] == 9 else {
                digits[i] += 1
                return digits
            }

            digits[i] = 0
        }

        digits.insert(1, at: 0)
        return digits
    }

}