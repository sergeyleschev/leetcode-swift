class Solution {

    // Solution by Sergey Leschev
    // 2498. Frog Jump II

    func maxJump(_ stones: [Int]) -> Int {
        var res = stones[1] - stones[0]  // store max difference
        for i in stride(from: 3, to: stones.count, by: 2) {
            res = max(res, stones[i] - stones[i - 2])  // odd path
        }
        for i in stride(from: 2, to: stones.count, by: 2) {
            res = max(res, stones[i] - stones[i - 2])  // even path
        }
        return res
    }
}
