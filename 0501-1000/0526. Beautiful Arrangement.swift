class Solution {

    // Solution by Sergey Leschev

    // 526. Beautiful Arrangement
    // Suppose you have n integers labeled 1 through n. A permutation of those n integers perm (1-indexed) is considered a beautiful arrangement if for every i (1 <= i <= n), either of the following is true:
    // perm[i] is divisible by i.
    // i is divisible by perm[i].
    // Given an integer n, return the number of the beautiful arrangements that you can construct.

    // Finds the number of beautiful arrangements that you can construct.
    //
    // - Parameter n: An integer.
    // - Returns: The number of beautiful arrangements.

    // Example 1:
    // Input: n = 2
    // Output: 2
    // Explanation:
    // The first beautiful arrangement is [1,2]:
    //     - perm[1] = 1 is divisible by i = 1
    //     - perm[2] = 2 is divisible by i = 2
    // The second beautiful arrangement is [2,1]:
    //     - perm[1] = 2 is divisible by i = 1
    //     - i = 2 is divisible by perm[2] = 1

    // Example 2:
    // Input: n = 1
    // Output: 1

    // Constraints:
    // 1 <= n <= 15

    // - Complexity:
    //   - time: O(m), where m is the number of valid permutations.
    //   - space: O(n), where n is the given n.

    private var ans = 0

    func countArrangement(_ n: Int) -> Int {
        var visited = [Bool](repeating: false, count: n + 1)
        calculate(n, 1, &visited)

        return ans
    }

    private func calculate(_ n: Int, _ position: Int, _ visited: inout [Bool]) {
        if position > n { ans += 1 }

        for i in 1...n {
            guard !visited[i], position % i == 0 || i % position == 0 else { continue }
            visited[i] = true
            calculate(n, position + 1, &visited)
            visited[i] = false
        }
    }

}
