class Solution {

    // Solution by Sergey Leschev
    // 2980. Check if Bitwise OR Has Trailing Zeros

    func hasTrailingZeros(_ nums: [Int]) -> Bool {
        var evenCount = 0

        for n in nums {
            evenCount += (n % 2 == 0) ? 1 : 0
        }

        return evenCount >= 2
    }
}
