class Solution {

    // Solution by Sergey Leschev
    // 2606. Find the Substring With Maximum Cost

    func maximumCostSubstring(_ s: String, _ chars: String, _ vals: [Int]) -> Int {
        var v = Array(1...26)  // 1-indexed alphabet values
        for (i, ch) in chars.enumerated() {
            v[Int(ch.asciiValue! - Character("a").asciiValue!)] = vals[i]
        }

        var maxCost = 0
        var cost = 0

        for ch in s {
            cost = max(0, cost + v[Int(ch.asciiValue! - Character("a").asciiValue!)])
            maxCost = max(maxCost, cost)
        }

        return maxCost
    }
}
