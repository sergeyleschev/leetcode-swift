class Solution {

    // Solution by Sergey Leschev
    // 2790. Maximum Number of Groups With Increasing Length
    // Time Complexity: O(NlogN)

    func maxIncreasingGroups(_ usageLimits: [Int]) -> Int {
        var sortedLimits = usageLimits.sorted()
        var total = 0
        var count = 0

        for i in 0..<sortedLimits.count {
            total += sortedLimits[i]
            if total >= ((count + 1) * (count + 2)) / 2 {
                count += 1
            }
        }

        return count
    }
}
