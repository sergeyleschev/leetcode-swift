class Solution {

    // Solution by Sergey Leschev
    // 2860. Happy Students

    func countWays(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var ways = sortedNums[0] == 0 ? 0 : 1

        for i in 0..<sortedNums.count {
            let countWith = i + 1

            if countWith > sortedNums[i]
                && (i + 1 == sortedNums.count || countWith < sortedNums[i + 1])
            {
                ways += 1
            }
        }

        return ways
    }
}
