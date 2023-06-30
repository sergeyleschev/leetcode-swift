class Solution {

    // Solution by Sergey Leschev

    // 390. Elimination Game
    // You have a list arr of all integers in the range [1, n] sorted in a strictly increasing order. Apply the following algorithm on arr:
    // Starting from left to right, remove the first number and every other number afterward until you reach the end of the list.
    // Repeat the previous step again, but this time from right to left, remove the rightmost number and every other number from the remaining numbers.
    // Keep repeating the steps again, alternating left to right and right to left, until a single number remains.
    // Given the integer n, return the last number that remains in arr.

    // Example 1:
    // Input: n = 9
    // Output: 6
    // Explanation:
    // arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    // arr = [2, 4, 6, 8]
    // arr = [2, 6]
    // arr = [6]

    // Example 2:
    // Input: n = 1
    // Output: 1

    // Constraints:
    // 1 <= n <= 10^9

    func lastRemaining(_ n: Int) -> Int {
        var num = n
        var res = 1
        var p = 1
        var cnt = 0
        
        while num > 1 {
            num /= 2
            cnt += 1
            p *= 2
            if cnt % 2 == 1 {
                res += (p / 2 + p * (num - 1))
            } else {
                res -= (p / 2 + p * (num - 1))
            }
        }
        return res
    }
    
}