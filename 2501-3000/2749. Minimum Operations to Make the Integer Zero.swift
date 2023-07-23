class Solution {

    // Solution by Sergey Leschev
    // 2749. Minimum Operations to Make the Integer Zero
    // Time complexity: O(1)
    // Space complexity: O(1)

    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        for k in 0...60 {
            let target = num1 - k * num2
            if target >= 0 && target.nonzeroBitCount <= k && k <= target {
                return k
            }
        }
        return -1
    }
}
