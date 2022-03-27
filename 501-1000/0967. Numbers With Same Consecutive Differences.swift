class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 967. Numbers With Same Consecutive Differences
    // Return all non-negative integers of length n such that the absolute difference between every two consecutive digits is k.
    // Note that every number in the answer must not have leading zeros. For example, 01 has one leading zero and is invalid.
    // You may return the answer in any order.

    // Finds all non-negative integers of length N such that the absolute difference between every two consecutive digits is K.

    // - Parameters:
    //   - N: The length of the integers.
    //   - K: The absolute difference.
    // - Returns: All non-negative integers of length N such that the absolute difference between every two consecutive digits is K.

    // Example 1:
    // Input: n = 3, k = 7
    // Output: [181,292,707,818,929]
    // Explanation: Note that 070 is not a valid number, because it has leading zeroes.

    // Example 2:
    // Input: n = 2, k = 1
    // Output: [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]

    // Example 3:
    // Input: n = 2, k = 0
    // Output: [11,22,33,44,55,66,77,88,99]

    // Example 4:
    // Input: n = 2, k = 2
    // Output: [13,20,24,31,35,42,46,53,57,64,68,75,79,86,97]

    // Constraints:
    // 2 <= n <= 9
    // 0 <= k <= 9

    // - Complexity:
    //   - time: O(n * 2^n), where n is the length of the integers.
    //   - space: O(2^n), where n is the length of the integers.
    
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        guard N > 1 else { return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
        var ans = [Int]()

        for num in 1..<10 { dfs(N - 1, num, K, &ans) }
        return ans
    }

    
    private func dfs(_ n: Int, _ num: Int, _ k: Int, _ ans: inout [Int]) {
        guard n > 0 else { ans.append(num); return }
        var nextDigits = [Int]()
        let tailDigits = num % 10

        nextDigits.append(tailDigits + k)

        if k != 0 { nextDigits.append(tailDigits - k) }

        for nextDigit in nextDigits {
            guard nextDigit >= 0, nextDigit < 10 else { continue }
            dfs(n - 1, num * 10 + nextDigit, k, &ans)
        }
    }

}