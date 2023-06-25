class Solution {

    // Solution @ Sergey Leschev

    // 47. Permutations II
    // Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

    // Finds all possible unique permutations in any order.

    // - Parameter nums: An array of numbers.
    // - Returns: All unique permutations.

    // Example 1:
    // Input: nums = [1,1,2]
    // Output:
    // [[1,1,2],
    //  [1,2,1],
    //  [2,1,1]]

    // Example 2:
    // Input: nums = [1,2,3]
    // Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
     
    // Constraints:
    // 1 <= nums.length <= 8
    // -10 <= nums[i] <= 10

    // - Complexity:
    //   - time: O(n * n!), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var dict = [Int: Int]()
        var ans = [[Int]]()
        var comb = [Int]()

        for num in nums { dict[num, default: 0] += 1 }
        backtrack(&comb, nums.count, &dict, &ans)
        return ans
    }


    private func backtrack(_ comb: inout [Int], _ n: Int, _ dict: inout [Int: Int], _ ans: inout [[Int]]) {
        guard comb.count != n else { ans.append(comb); return }

        for (_, el) in dict.enumerated() {
            guard el.value != 0 else { continue }
            comb.append(el.key)
            dict[el.key, default: 0] -= 1
            backtrack(&comb, n, &dict, &ans)
            comb.removeLast()
            dict[el.key] = el.value
        }
    }

}