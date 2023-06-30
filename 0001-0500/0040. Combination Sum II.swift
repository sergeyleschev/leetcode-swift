class Solution {

    // Solution by Sergey Leschev

    // 40. Combination Sum II
    // Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.
    // Each number in candidates may only be used once in the combination.
    // Note: The solution set must not contain duplicate combinations.

    // Example 1:
    // Input: candidates = [10,1,2,7,6,1,5], target = 8
    // Output: 
    // [
    // [1,1,6],
    // [1,2,5],
    // [1,7],
    // [2,6]
    // ]

    // Example 2:
    // Input: candidates = [2,5,2,1,2], target = 5
    // Output: 
    // [
    // [1,2,2],
    // [5]
    // ]
     
    // Constraints:
    // 1 <= candidates.length <= 100
    // 1 <= candidates[i] <= 50
    // 1 <= target <= 30

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        var res: [[Int]] = []


        func backtrack(_ path: [Int], _ input: [Int], _ target: Int, _ index: Int) {
            var path = path
            var last: Int?

            for (i, num) in input.enumerated() {
                if let last = last, last == num { continue }
                if i <= index { continue }
                if num == target {
                    res.append(path + [num])
                    break
                }
                if num > target { break }
                if num < target {
                    path.append(num)
                    backtrack(path, input, target - num, i)
                    path.remove(at: path.count - 1)
                }
                last = num
            }
        }
        backtrack([], sorted, target, -1)
        return res
    }

}