class Solution {

    // Solution by Sergey Leschev
    // 2568. Minimum Impossible OR

    // Time Complexity: O(32n)
    // Space Complexity: O(32n)

    func minImpossibleOR(_ nums: [Int]) -> Int {
        var numsSet = Set(nums)
        var result = 1

        while true {
            if !numsSet.contains(result) {
                return result
            }
            result <<= 1
        }
    }
}
