class Solution {

    // Solution by Sergey Leschev
    // 2529. Maximum Count of Positive Integer and Negative Integer

    func maximumCount(_ nums: [Int]) -> Int {
        var posCount = 0
        var negCount = 0

        for num in nums {
            if num > 0 {
                posCount += 1
            } else if num < 0 {
                negCount += 1
            }
        }

        return max(posCount, negCount)
    }
}
