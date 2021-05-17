class Solution {

    // 39. Combination Sum
    // Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
    // The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
    // It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

    // Finds a list of all unique combinations of `candidates`, where the chosen numbers
    // sum to `target`.
    
    // - Parameters:
    //   - candidates: An array of distinct integers.
    //   - target: A target integer.
    // - Returns: A list of all unique combinations.

    // Example 1:
    // Input: candidates = [2,3,6,7], target = 7
    // Output: [[2,2,3],[7]]
    // Explanation:
    // 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
    // 7 is a candidate, and 7 = 7.
    // These are the only two combinations.

    // Example 2:
    // Input: candidates = [2,3,5], target = 8
    // Output: [[2,2,2,2],[2,3,3],[3,5]]

    // Example 3:
    // Input: candidates = [2], target = 1
    // Output: []

    // Example 4:
    // Input: candidates = [1], target = 1
    // Output: [[1]]

    // Example 5:
    // Input: candidates = [1], target = 2
    // Output: [[1,1]]
     
    // Constraints:
    // 1 <= candidates.length <= 30
    // 1 <= candidates[i] <= 200
    // All elements of candidates are distinct.
    // 1 <= target <= 500

    /// - Complexity:
    ///   - time: O(n^m), where n is the length of `candidates` and m is the `target` value.
    ///   - space: O(m), where m is the `target` value.
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var comb = [Int]()
        
        backtrack(remain: target, comb: &comb, start: 0, candidates: candidates, ans: &ans)
        return ans
    }


    private func backtrack(remain: Int, comb: inout [Int], start: Int, candidates: [Int], ans: inout [[Int]]) {
        guard remain >= 0 else { return }
        guard remain != 0 else { ans.append(comb); return }

        for i in start..<candidates.count {
            comb.append(candidates[i])
            backtrack(remain: remain - candidates[i], comb: &comb, start: i, candidates: candidates, ans: &ans)
            comb.removeLast()
        }
    }

}