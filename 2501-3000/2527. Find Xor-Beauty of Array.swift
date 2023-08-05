class Solution {

    // Solution by Sergey Leschev
    // 2527. Find Xor-Beauty of Array

    func xorBeauty(_ nums: [Int]) -> Int {
        var xor = 0
        for num in nums {
            xor ^= num
        }
        return xor
    }
}
