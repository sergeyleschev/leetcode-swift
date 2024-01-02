class Solution {

    // Solution by Sergey Leschev
    // 2571. Minimum Operations to Reduce an Integer to 0

    // Time Complexity: O(logn)
    // Space Complexity: O(1)

    func minOperations(_ n: Int) -> Int {
        var res = 0
        var num = n

        while num > 0 {
            if num % 2 == 0 {
                num >>= 1
            } else if (num & 2) > 0 {
                num += 1
                res += 1
            } else {
                res += 1
                num >>= 2
            }
        }

        return res
    }
}
