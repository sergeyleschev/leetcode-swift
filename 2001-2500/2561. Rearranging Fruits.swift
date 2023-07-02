class Solution {

    // Solution by Sergey Leschev
    // 2561. Rearranging Fruits

    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var cnt: [Int: Int] = [:]
        for c in basket1 {
            cnt[c, default: 0] += 1
        }
        for c in basket2 {
            cnt[c, default: 0] -= 1
        }
        var last: [Int] = []
        for (k, v) in cnt {
            if v % 2 != 0 {
                return -1
            }
            for _ in 0..<abs(v) / 2 {
                last.append(k)
            }
        }
        let minx = min(basket1.min()!, basket2.min()!)
        last.sort()
        let endIndex = last.count / 2
        let sum = last[0..<endIndex].reduce(0) { $0 + min(2 * minx, $1) }
        return sum
    }
}
