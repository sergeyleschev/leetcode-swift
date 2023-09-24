class Solution {

    // Solution by Sergey Leschev
    // 2829. Determine the Minimum Sum of a k-avoiding Array

    // Time complexity: O(1)
    // Space complexity: O(1)

    func minimumSum(_ n: Int, _ k: Int) -> Int {
        // Function to calculate the sum of integers from 1 to `count`.
        func calculateSumInRange(start: Int, count: Int) -> Int {
            return (count * (2 * start + (count - 1))) / 2
        }

        let middle = k / 2

        if n <= middle {
            // If n is less than or equal to middle, we can simply sum the first n positive integers.
            return n * (n + 1) / 2
        }

        let leftSum = middle * (middle + 1) / 2

        let remainingNumbers = n - middle

        return leftSum + calculateSumInRange(start: k, count: remainingNumbers)
    }
}
