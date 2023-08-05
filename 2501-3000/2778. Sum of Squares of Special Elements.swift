class Solution {

    // Solution by Sergey Leschev
    // 2778. Sum of Squares of Special Elements

    func sumOfSquares(_ nums: [Int]) -> Int {
        var sum = 0
        let n = nums.count

        for i in 0..<n {
            if n % (i + 1) == 0 {
                sum += nums[i] * nums[i]
            }
        }

        return sum
    }
}
