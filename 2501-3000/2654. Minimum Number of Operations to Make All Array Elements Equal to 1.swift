class Solution {

    // Solution by Sergey Leschev
    // 2654. Minimum Number of Operations to Make All Array Elements Equal to 1
    // Time complexity: O(N^2)
    // Space complexity: O(1)

    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var c = nums.filter { $0 == 1 }.count  // Count of ones in the array

        if c != 0 {
            return n - c  // If there is at least one '1', it's easy
        }

        var res = Int.max  // Just a dummy value to represent infinity
        var g = 0  // Variable to store gcd of elements from i to j

        for i in 0..<n {
            g = nums[i]
            for j in i + 1..<n {
                g = gcd(g, nums[j])
                if g == 1 {
                    res = min(res, j - i + (n - 1))  // Number of operations to make this element 1 + number of non-ones (n-1).
                    break
                }
            }
        }

        return res == Int.max ? -1 : res
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }
}
