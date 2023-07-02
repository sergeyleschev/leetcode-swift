class Solution {

    // Solution by Sergey Leschev

    // 869. Reordered Power of 2
    // You are given an integer n. We reorder the digits in any order (including the original order) such that the leading digit is not zero.
    // Return true if and only if we can do this so that the resulting number is a power of two.

    // Finds if we can reorder digits in `N` and get the power of 2.

    // - Parameter N: A positive integer.
    // - Returns: True if the resulting number is a power of 2, otherwise returns false.

    // Example 1:
    // Input: n = 1
    // Output: true

    // Example 2:
    // Input: n = 10
    // Output: false

    // Example 3:
    // Input: n = 16
    // Output: true

    // Example 4:
    // Input: n = 24
    // Output: false

    // Example 5:
    // Input: n = 46
    // Output: true

    // Constraints:
    // 1 <= n <= 10^9

    // - Complexity:
    //   - time: O(log^2 n), where n is the given N.
    //   - space: O(log n), where n is the given N.

    func reorderedPowerOf2(_ N: Int) -> Bool {
        let a = count(N)
        for i in 0..<31 {
            guard a == count(1 << i) else { continue }
            return true
        }
        return false
    }

    private func count(_ n: Int) -> [Int] {
        var n = n
        var ans = [Int](repeating: 0, count: 10)

        while n > 0 {
            ans[n % 10] += 1
            n /= 10
        }
        return ans
    }

}
