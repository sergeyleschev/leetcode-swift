class Solution {

    // Solution by Sergey Leschev

    // 367. Valid Perfect Square
    // Given a positive integer num, write a function which returns True if num is a perfect square else False.
    // Follow up: Do not use any built-in library function such as sqrt.

    // Newton's Algorithm for checking if the number is a perfect square.

    // - Parameter num: Positive integer.
    // - Returns: True if num is a perfect square, otherwise returns false.

    // Example 1:
    // Input: num = 16
    // Output: true

    // Example 2:
    // Input: num = 14
    // Output: false 

    // Constraints:
    // 1 <= num <= 2^31 - 1

    // - Complexity:
    //   - time: O(log n), where n is the num.
    //   - space: O(1), only constant space is used.

    func isPerfectSquare(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        var n = num

        while n * n > num { n = (n + num / n) / 2 }
        return n * n == num
    }

}