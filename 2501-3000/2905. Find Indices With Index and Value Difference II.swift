class Solution {

    // Solution by Sergey Leschev
    // 2905. Find Indices With Index and Value Difference II

    // Time complexity: O(N)
    // Space complexity: O(1)

    func findIndices(_ nums: [Int], _ indexDifference: Int, _ valueDifference: Int) -> [Int] {
        var minIndex = 0
        var maxIndex = 0

        for i in stride(from: indexDifference, to: nums.count, by: 1) {
            if nums[i - indexDifference] < nums[minIndex] {
                minIndex = i - indexDifference
            }
            if nums[i - indexDifference] > nums[maxIndex] {
                maxIndex = i - indexDifference
            }

            if abs(nums[i] - nums[minIndex]) >= valueDifference {
                return [minIndex, i]
            }
            if abs(nums[i] - nums[maxIndex]) >= valueDifference {
                return [maxIndex, i]
            }
        }

        return [-1, -1]
    }
}
