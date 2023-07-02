class Solution {

    // Solution by Sergey Leschev

    // 473. Matchsticks to Square
    // You are given an integer array matchsticks where matchsticks[i] is the length of the ith matchstick. You want to use all the matchsticks to make one square. You should not break any stick, but you can link them up, and each matchstick must be used exactly one time.
    // Return true if you can make this square and false otherwise.

    // Example 1:
    // Input: matchsticks = [1,1,2,2,2]
    // Output: true
    // Explanation: You can form a square with length 2, one side of the square came two sticks with length 1.

    // Example 2:
    // Input: matchsticks = [3,3,3,3,4]
    // Output: false
    // Explanation: You cannot find a way to form a square with all the matchsticks.

    // Constraints:
    // 1 <= matchsticks.length <= 15
    // 0 <= matchsticks[i] <= 10^9

    func makesquare(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n < 4 { return false }
        let sum = nums.reduce(0) { (r, v) -> Int in return r + v }
        if sum % 4 != 0 { return false }
        let target = sum / 4
        let visited = [Bool](repeating: false, count: n)
        let count = 0

        return canFind(
            target: target, left: target,
            visitied: visited, nums: nums, start: 0, count: count)
    }

    func canFind(target: Int, left: Int, visitied: [Bool], nums: [Int], start: Int, count: Int)
        -> Bool
    {
        if start == nums.count || left < 0 { return false }

        if left == 0 {
            let newCount = 1 + count

            if newCount == 3 {
                return true
            } else {
                return canFind(
                    target: target, left: target,
                    visitied: visitied, nums: nums, start: 0, count: newCount)
            }
        }

        for i in start..<nums.count {
            var v = visitied
            if v[i] { continue }

            v[i] = true
            if canFind(
                target: target, left: left - nums[i], visitied: v, nums: nums, start: i + 1,
                count: count)
            {
                return true
            }

            v[i] = false

        }

        return false
    }

}
