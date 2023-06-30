class Solution {

    // Solution by Sergey Leschev

    // 202. Happy Number
    // Write an algorithm to determine if a number n is happy.
    // A happy number is a number defined by the following process:
    // Starting with any positive integer, replace the number by the sum of the squares of its digits.
    // Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    // Those numbers for which this process ends in 1 are happy.
    // Return true if n is a happy number, and false if not.

    // Finds if a given number is happy humber.

    // - Parameter n: The number.
    // - Returns: True if n is a happy number, otherwise returns false.

    // Example 1:
    // Input: n = 19
    // Output: true
    // Explanation:
    // 12 + 92 = 82
    // 82 + 22 = 68
    // 62 + 82 = 100
    // 12 + 02 + 02 = 1

    // Example 2:
    // Input: n = 2
    // Output: false
     
    // Constraints:
    // 1 <= n <= 2^31 - 1

    // - Complexity:
    //     - time: O(log n), where n is the given n.
    //     - space: O(log n), where n is the given n.

    func isHappy(_ n: Int) -> Bool {
        var n = n
        var seen = Set<Int>()
        
        while n != 1, !seen.contains(n) {
            seen.insert(n)
            n = getNext(n)
        }
        
        return n == 1
    }
    
    
    private func getNext(_ n: Int) -> Int {
        var n = n
        var ans = 0

        while n > 0 {
            let d = n % 10
            n /= 10
            ans += d * d
        }
        return ans
    }

}