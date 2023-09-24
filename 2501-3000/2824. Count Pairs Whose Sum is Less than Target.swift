class Solution {

    // Solution by Sergey Leschev
    // 2824. Count Pairs Whose Sum is Less than Target
    // Two Pointers

    // Time complexity: O(n log n)
    // Space complexity: O(1)

    func countPairs(_ nums: [Int], _ target: Int) -> Int {
        var count = 0
        var left = 0
        var right = nums.count - 1

        let sortedNums = nums.sorted()

        while left < right {
            if sortedNums[left] + sortedNums[right] < target {
                count += right - left
                left += 1
            } else {
                right -= 1
            }
        }

        return count
    }
}
