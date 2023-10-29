class Solution {

    // Solution by Sergey Leschev
    // 2897. Apply Operations on Array to Maximize Sum of Squares

    // Time complexity: O(32n)
    // Space complexity: O(32)

    func maxSum(_ nums: [Int], _ k: Int) -> Int {
        var count = [Int](repeating: 0, count: 32)
        var res: Int64 = 0
        let mod: Int64 = 1_000_000_007

        for a in nums {
            for i in 0..<32 {
                if (a & (1 << i)) != 0 {
                    count[i] += 1
                }
            }
        }

        for _ in 0..<k {
            var cur: Int64 = 0
            for i in 0..<32 {
                if count[i] > 0 {
                    count[i] -= 1
                    cur += Int64(1 << i)
                }
            }
            res = (res + cur * cur % mod) % mod
        }

        return Int(res)
    }
}
