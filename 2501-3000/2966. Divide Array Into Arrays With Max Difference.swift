class Solution {

    // Solution by Sergey Leschev
    // 2966. Divide Array Into Arrays With Max Difference

    // Time complexity: O(N log N)
    // Space complexity: O(1)

    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var ans: [[Int]] = []
        let sortedNums = nums.sorted()

        for i in stride(from: 2, to: sortedNums.count, by: 3) {
            if sortedNums[i] - sortedNums[i - 2] > k {
                return []
            }
            ans.append([sortedNums[i - 2], sortedNums[i - 1], sortedNums[i]])
        }

        return ans
    }
}
