class Solution {

    // Solution by Sergey Leschev
    // 2551. Put Marbles in Bags

    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        let n = weights.count
        if k == 1 || n == k {
            return 0
        }

        var candidates: [Int] = []
        for i in 0..<(n - 1) {
            candidates.append(weights[i] + weights[i + 1])
        }
        candidates.sort()

        var mins: Int64 = 0
        var maxs: Int64 = 0
        for i in 0..<(k - 1) {
            mins += Int64(candidates[i])
            maxs += Int64(candidates[n - 2 - i])
        }

        return Int(maxs - mins)
    }
}
