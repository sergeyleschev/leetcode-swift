class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 216. Combination Sum III
    // Find all valid combinations of k numbers that sum up to n such that the following conditions are true:
    // Only numbers 1 through 9 are used.
    // Each number is used at most once.
    // Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

    // Finds all possible combinations of k numbers that add up to a number n.

    // - Parameters:
    //   - k: The number of digits in combination.
    //   - n: The number.
    // - Returns: All possible combinations.

    // Example 1:
    // Input: k = 3, n = 7
    // Output: [[1,2,4]]
    // Explanation:
    // 1 + 2 + 4 = 7
    // There are no other valid combinations.

    // Example 2:
    // Input: k = 3, n = 9
    // Output: [[1,2,6],[1,3,5],[2,3,4]]
    // Explanation:
    // 1 + 2 + 6 = 9
    // 1 + 3 + 5 = 9
    // 2 + 3 + 4 = 9
    // There are no other valid combinations.

    // Example 3:
    // Input: k = 4, n = 1
    // Output: []
    // Explanation: There are no valid combinations. [1,2,1] is not valid because 1 is used twice.

    // Example 4:
    // Input: k = 3, n = 2
    // Output: []
    // Explanation: There are no valid combinations.

    // Example 5:
    // Input: k = 9, n = 45
    // Output: [[1,2,3,4,5,6,7,8,9]]
    // Explanation:
    // 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45
    // There are no other valid combinations.

    // Constraints:
    // 2 <= k <= 9
    // 1 <= n <= 60

    // - Complexity:
    //   - time: O(m), where m is the number of combinations.
    //   - space: O(m), where m is the number of combinations.

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var ans = [[Int]]()
        var curr = [Int]()
        backtracking(k: k, n: n, start: 0, curr: &curr, ans: &ans)
        return ans
    }


    private func backtracking(k: Int, n: Int, start: Int, curr: inout [Int], ans: inout [[Int]]) {
        if n == 0, curr.count == k { ans.append(curr); return } 
        else if n < 0 || curr.count == k { return }

        for i in start..<9 {
            curr.append(i + 1)
            backtracking(k: k, n: n - i - 1, start: i + 1, curr: &curr, ans: &ans)
            curr.removeLast()
        }
    }

}