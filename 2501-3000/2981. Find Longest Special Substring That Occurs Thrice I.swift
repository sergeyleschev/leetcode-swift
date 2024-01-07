class Solution {

    // Solution by Sergey Leschev
    // 2981. Find Longest Special Substring That Occurs Thrice I

    // Time complexity: O(N)
    // Space complexity: O(N)

    func maximumLength(_ s: String) -> Int {
        var count = 0
        var last = s[s.startIndex]
        var ans = 0
        var ump = [Character: [Int]]()

        for c in s {
            if c == last {
                count += 1
            } else {
                if ump[last] == nil {
                    ump[last] = [count]
                } else {
                    ump[last]?.append(count)
                }
                count = 1
                last = c
            }
        }
        if ump[last] == nil {
            ump[last] = [count]
        } else {
            ump[last]?.append(count)
        }

        for (k, v) in ump {
            var l1 = 0
            var l2 = 0
            var l3 = 0

            for e in v {
                if l1 < e {
                    l3 = l2
                    l2 = l1
                    l1 = e
                } else if l2 < e {
                    l3 = l2
                    l2 = e
                } else if l3 < e {
                    l3 = e
                }
            }

            if l1 == l2 && l1 > l3 {
                l2 -= 1
            }

            if l1 + l2 + l3 >= 3 {
                ans = max(ans, l1 - 2, l2)
            }
        }

        return ans != 0 ? ans : -1
    }
}
