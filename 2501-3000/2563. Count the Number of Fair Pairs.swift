class Solution {

    // Solution by Sergey Leschev
    // 2563. Count the Number of Fair Pairs
    // Time complexity: O(sort)

    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var count = 0

        func countLess(_ nums: [Int], _ val: Int) -> Int {
            var res = 0
            var i = 0
            var j = nums.count - 1

            while i < j {
                if nums[i] + nums[j] > val {
                    j -= 1
                } else {
                    res += j - i
                    i += 1
                }
            }

            return res
        }

        let sortedNums = nums.sorted()
        count = countLess(sortedNums, upper) - countLess(sortedNums, lower - 1)

        return count
    }
}
