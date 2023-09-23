class Solution {

    // Solution by Sergey Leschev
    // 2835. Minimum Operations to Form Subsequence With Target Sum

    func minOperations(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted(by: >)  // Sort in descending order
        var operations = 0
        var totalSum = nums.reduce(0, +)
        var remainingTarget = target  // Create a mutable variable for the remaining target

        if totalSum < target {
            return -1
        }

        while totalSum > remainingTarget {
            let a = nums.removeFirst()
            if totalSum - a >= remainingTarget {
                totalSum -= a
            } else if a <= remainingTarget {
                totalSum -= a
                remainingTarget -= a
            } else {
                let halfA = a / 2
                nums.append(halfA)
                nums.append(halfA)
                nums.sort(by: >)  // Re-sort after adding two halves
                operations += 1
            }
        }

        return operations
    }
}
