class Solution {

    // Solution by Sergey Leschev

    // 461. Hamming Distance
    // The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
    // Given two integers x and y, return the Hamming distance between them.

    // Calculates the Hamming distance between two integers.

    // - Parameters:
    //   - x: The integer.
    //   - y: The integer.
    // - Returns: The Hamming distance.

    // Example 1:
    // Input: x = 1, y = 4
    // Output: 2
    // Explanation:
    // 1   (0 0 0 1)
    // 4   (0 1 0 0)
    //        ↑   ↑
    // The above arrows point to positions where the corresponding bits are different.

    // Example 2:
    // Input: x = 3, y = 1
    // Output: 1

    // Constraints:
    // 0 <= x, y <= 2^31 - 1

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }

}
