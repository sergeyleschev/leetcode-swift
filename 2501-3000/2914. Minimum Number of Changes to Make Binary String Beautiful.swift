class Solution {

    // Solution by Sergey Leschev
    // 2914. Minimum Number of Changes to Make Binary String Beautiful

    func minChanges(_ s: String) -> Int {
        var ans = 0
        var lastSeen = s.first!
        var count = 0

        for c in s {
            if c == lastSeen {
                count += 1
            } else {
                if count % 2 != 0 {
                    ans += 1
                    count = 0
                } else {
                    count = 1
                }
                lastSeen = c
            }
        }

        return ans
    }
}
