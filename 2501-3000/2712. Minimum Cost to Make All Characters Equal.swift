class Solution {

    // Solution by Sergey Leschev
    // 2712. Minimum Cost to Make All Characters Equal

    func minimumCost(_ s: String) -> Int {
        var ans = 0
        let n = s.count
        let sArray = Array(s)

        for i in 1..<n {
            if sArray[i] != sArray[i - 1] {
                ans += min(i, n - i)  // Key Observation
            }
        }

        return ans
    }
}
