class Solution {

    // Solution by Sergey Leschev
    // 2859. Sum of Values at Indices With K Set Bits

    // Time complexity: O(n * log n)
    // Space complexity: O(1)

    func sumIndicesWithKSetBits(_ nums: [Int], _ k: Int) -> Int {
        // Function to count the set bits in a number
        func getBitCount(_ number: Int) -> Int {
            var bitCount = 0
            var num = number
            while num > 0 {
                if num % 2 == 1 {
                    bitCount += 1
                }
                num = num >> 1
            }
            return bitCount
        }

        var sum = 0
        for i in 0..<nums.count {
            if getBitCount(i) == k {
                sum += nums[i]
            }
        }

        return sum
    }
}
