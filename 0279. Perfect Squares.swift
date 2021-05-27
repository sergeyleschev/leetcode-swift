class Solution {

  // 279. Perfect Squares
  // Given an integer n, return the least number of perfect square numbers that sum to n.
  // A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

  // Example 1:
  // Input: n = 12
  // Output: 3
  // Explanation: 12 = 4 + 4 + 4.

  // Example 2:
  // Input: n = 13
  // Output: 2
  // Explanation: 13 = 4 + 9.

  // Constraints:
  // 1 <= n <= 10^4

  // - Complexity:
  //   - time: O(n^2).
  //   - space: O(n).

  func numSquares(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
      
    // perfectNums is an Array, which stores the minimum nums of square numbers to sum up for index 'i'.
    var perfectNums = Array(repeating: Int.max, count: n + 1)

    perfectNums[0] = 0
    for i in 1...n {
      for j in 1...i {
        if j * j > i { break }
        perfectNums[i] = min(perfectNums[i], perfectNums[i - j * j] + 1)
      }
    }
    
    return perfectNums[n]
  }

}