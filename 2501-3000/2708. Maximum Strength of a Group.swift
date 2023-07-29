class Solution {

    // Solution by Sergey Leschev
    // 2708. Maximum Strength of a Group

    func maxStrength(_ nums: [Int]) -> Int {
        var prod: Int64 = 1
        var largestNegative: Int = Int.min
        var largest: Int = Int.min
        var negCount: Int = 0

        for n in nums {
            if n != 0 {
                prod *= Int64(n)
            }
            if n < 0 {
                largestNegative = max(largestNegative, n)
                negCount += 1
            }
            largest = max(largest, n)
        }

        if largest == 0 && negCount < 2 {
            return 0
        }

        if largest < 0 && negCount == 1 {
            return largestNegative
        }

        if prod > 0 {
            return Int(prod)
        }

        return Int(prod / Int64(largestNegative))
    }
}
