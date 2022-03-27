class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1317. Convert Integer to the Sum of Two No-Zero Integers
    // Given an integer n. No-Zero integer is a positive integer which doesn't contain any 0 in its decimal representation.
    // Return a list of two integers [A, B] where:
    // A and B are No-Zero integers.
    // A + B = n
    // It's guarateed that there is at least one valid solution. If there are many valid solutions you can return any of them.

    // Example 1:
    // Input: n = 2
    // Output: [1,1]
    // Explanation: A = 1, B = 1. A + B = n and both A and B don't contain any 0 in their decimal representation.

    // Example 2:
    // Input: n = 11
    // Output: [2,9]

    // Example 3:
    // Input: n = 10000
    // Output: [1,9999]

    // Example 4:
    // Input: n = 69
    // Output: [1,68]

    // Example 5:
    // Input: n = 1010
    // Output: [11,999]

    // Constraints:
    // 2 <= n <= 10^4

    func getNoZeroIntegers(_ n: Int) -> [Int] {
        var target = 0
        
        for i in 1...n/2 {
            if containZero(i) { continue }
            if containZero(n - i) { continue }
            target = i
            break
        }

        return [target, n - target]
    }


    func containZero(_ num: Int) -> Bool {
        if num == 0 { return true }
        var num = num
        
        while num > 0 {
            if num % 10 == 0 { return true }
            num = num / 10
        }
        
        return false
    }

}