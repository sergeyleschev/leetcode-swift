class Solution {

    // Solution by Sergey Leschev
    // 2903. Find Indices With Index and Value Difference I

    func findIndices(_ nums: [Int], _ indexDifference: Int, _ valueDifference: Int) -> [Int] {
        // If both differences are zero, return any pair of indices
        if indexDifference == 0 && valueDifference == 0 {
            return [0, 0]
        }

        // Create an array of all pairs of indices that satisfy the index difference condition
        let pairs = nums.indices
            .flatMap { i in nums.indices.map { j in (i, j) } }
            .filter { abs($0.0 - $0.1) >= indexDifference }

        // Loop through the pairs and check the value difference condition
        for (i, j) in pairs {
            if abs(nums[i] - nums[j]) >= valueDifference {
                return [i, j]
            }
        }

        // If no pair satisfies both conditions, return [-1, -1]
        return [-1, -1]
    }
}
