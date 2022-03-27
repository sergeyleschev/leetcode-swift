class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1760. Minimum Limit of Balls in a Bag
    // You are given an integer array nums where the ith bag contains nums[i] balls. You are also given an integer maxOperations.
    // You can perform the following operation at most maxOperations times:
    // Take any bag of balls and divide it into two new bags with a positive number of balls.
    // For example, a bag of 5 balls can become two new bags of 1 and 4 balls, or two new bags of 2 and 3 balls.
    // Your penalty is the maximum number of balls in a bag. You want to minimize your penalty after the operations.

    // Return the minimum possible penalty after performing the operations.

    // Example 1:
    // Input: nums = [9], maxOperations = 2
    // Output: 3
    // Explanation: 
    // - Divide the bag with 9 balls into two bags of sizes 6 and 3. [9] -> [6,3].
    // - Divide the bag with 6 balls into two bags of sizes 3 and 3. [6,3] -> [3,3,3].
    // The bag with the most number of balls has 3 balls, so your penalty is 3 and you should return 3.

    // Example 2:
    // Input: nums = [2,4,8,2], maxOperations = 4
    // Output: 2
    // Explanation:
    // - Divide the bag with 8 balls into two bags of sizes 4 and 4. [2,4,8,2] -> [2,4,4,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,4,4,4,2] -> [2,2,2,4,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,2,2,4,4,2] -> [2,2,2,2,2,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,2,2,2,2,4,2] -> [2,2,2,2,2,2,2,2].
    // The bag with the most number of balls has 2 balls, so your penalty is 2 an you should return 2.

    // Example 3:
    // Input: nums = [7,17], maxOperations = 2
    // Output: 7

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= maxOperations, nums[i] <= 10^9

    // Solution: Binary Search

    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        let sortedNums = nums.sorted()
        let n = sortedNums.count
        var l = 0
        var r = nums.max()!
        var ans = Int.max

        
        func check(_ maxCost: Int) -> Bool {
            guard maxCost > 0 else { return false }
            var remainOperationsCnt = maxOperations
            for idx in stride(from: n - 1, through: 0, by: -1) {
                guard sortedNums[idx] > maxCost else { break }
                remainOperationsCnt -= sortedNums[idx] / maxCost
                if sortedNums[idx] % maxCost == 0 { remainOperationsCnt += 1 }
                guard remainOperationsCnt >= 0 else { return false }
            }
            return true 
        }

        while l < r {
            let mid = l + (r - l) >> 1
            if check(mid) {
                ans = min(ans, mid)
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return check(l) ? min(l, ans) : ans
    }

}