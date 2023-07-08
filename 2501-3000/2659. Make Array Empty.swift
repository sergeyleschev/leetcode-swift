class Solution {

    // Solution by Sergey Leschev
    // 2659. Make Array Empty

    func countOperationsToEmptyArray(_ nums: [Int]) -> Int {
        var sortedIndex = Array(nums.enumerated()).sorted { $0.element < $1.element }.map {
            $0.offset
        }
        var s = 0
        var curr = 0
        var currLoopSubtract = 0
        var loopedSubtract = 0

        for ind in sortedIndex {
            if curr <= ind {
                s += ind - curr + 1
                curr = ind + 1
                currLoopSubtract += 1
            } else {  // wrap around
                s += ind + (nums.count - curr) + 1
                curr = ind + 1
                s -= loopedSubtract
                loopedSubtract += currLoopSubtract
                currLoopSubtract = 1
            }
        }

        s -= (curr - currLoopSubtract)
        return s
    }
}
