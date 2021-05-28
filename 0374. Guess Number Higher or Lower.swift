/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if the picked number is lower than your guess number
 *			      1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {

    // 374. Guess Number Higher or Lower
    // We are playing the Guess Game. The game is as follows:
    // I pick a number from 1 to n. You have to guess which number I picked.
    // Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.
    // You call a pre-defined API int guess(int num), which returns 3 possible results:
    // -1: The number I picked is lower than your guess (i.e. pick < num).
    // 1: The number I picked is higher than your guess (i.e. pick > num).
    // 0: The number I picked is equal to your guess (i.e. pick == num).
    // Return the number that I picked.

    // Example 1:
    // Input: n = 10, pick = 6
    // Output: 6

    // Example 2:
    // Input: n = 1, pick = 1
    // Output: 1

    // Example 3:
    // Input: n = 2, pick = 1
    // Output: 1

    // Example 4:
    // Input: n = 2, pick = 2
    // Output: 2

    // Constraints:
    // 1 <= n <= 2^31 - 1
    // 1 <= pick <= n

    func guessNumber(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var left = 1
        var right = n
        
        while left <= right {
            let middle = (left + right) / 2
            
            if guess(middle) == 0 {
                return middle
            } else if guess(middle) == -1 {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
}