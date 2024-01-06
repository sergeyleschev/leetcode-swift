class Solution {

    // Solution by Sergey Leschev
    // 2943. Maximize Area of Square Hole in Grid

    func getMaxGap(_ bars: [Int]) -> Int {
        var sortedBars = bars.sorted()
        var count = 2
        var res = 2

        for i in 1..<sortedBars.count {
            if sortedBars[i - 1] + 1 == sortedBars[i] {
                count += 1
            } else {
                count = 2
            }
            res = max(res, count)
        }

        return res
    }

    func maximizeSquareHoleArea(_ n: Int, _ m: Int, _ hBars: [Int], _ vBars: [Int]) -> Int {
        let gap = min(getMaxGap(hBars), getMaxGap(vBars))
        return gap * gap
    }
}
