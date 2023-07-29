class Solution {

    // Solution by Sergey Leschev
    // 2616. Minimize the Maximum Difference of Pairs
    // Time Complexity: O(nlog(max(A)) + nlogn)
    // Space Complexity: O(logn)

    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        let sortedNums = nums.sorted()
        var left = 0
        var right = sortedNums.last! - sortedNums.first!

        while left < right {
            let mid = (left + right) / 2
            var k = 0
            var i = 1

            while i < sortedNums.count && k < p {
                if sortedNums[i] - sortedNums[i - 1] <= mid {
                    k += 1
                    i += 2
                } else {
                    i += 1
                }
            }

            if k >= p {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }
}
