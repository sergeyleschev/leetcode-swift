class Solution {

    // Solution by Sergey Leschev
    // 2808. Minimum Seconds to Equalize a Circular Array

    func minimumSeconds(_ nums: [Int]) -> Int {
        var nPos: [Int: [Int]] = [:]
        for (i, num) in nums.enumerated() {
            nPos[num, default: []].append(i)
        }

        var result = Int.max
        for (_, pos) in nPos {
            var updatedPos = pos
            updatedPos.append(pos[0] + nums.count)
            var seconds = 0
            for i in 1..<updatedPos.count {
                seconds = max(seconds, (updatedPos[i] - updatedPos[i - 1]) / 2)
            }
            result = min(result, seconds)
        }

        return result
    }
}
