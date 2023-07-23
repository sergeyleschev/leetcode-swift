class Solution {

    // Solution by Sergey Leschev
    // 2740. Find the Value of the Partition

    func findValueOfPartition(_ nums: [Int]) -> Int {
        var ans = Int.max
        let sortedNums = nums.sorted()
        for i in 1..<sortedNums.count {
            ans = min(ans, sortedNums[i] - sortedNums[i - 1])
        }
        return ans
    }
}
