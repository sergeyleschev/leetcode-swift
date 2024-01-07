class Solution {

    // Solution by Sergey Leschev
    // 2971. Find Polygon With the Largest Perimeter

    // Time complexity: O(n)
    // Space complexity: O(1)

    func largestPerimeter(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted(by: <)
        var sum = 0

        for num in sortedNums {
            sum += num
        }

        for i in stride(from: sortedNums.count - 1, through: 2, by: -1) {
            sum -= sortedNums[i]
            if sortedNums[i] < sum {
                return sum + sortedNums[i]
            }
        }

        return -1
    }
}
