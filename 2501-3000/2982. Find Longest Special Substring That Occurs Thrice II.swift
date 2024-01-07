class Solution {

    // Solution by Sergey Leschev
    // 2982. Find Longest Special Substring That Occurs Thrice II

    // Time complexity: O(N)
    // Space complexity: O(1)

    func maximumLength(_ s: String) -> Int {
        var count = 0
        var last = s.first!
        var ans = 0
        var ump = [Character: [Int]]()

        for char in s {
            if char == last {
                count += 1
            } else {
                ump[last, default: []].append(count)

                if ump[last]!.count >= 4 {
                    ump[last]?.sort(by: >)
                    ump[last]?.removeLast()
                }

                count = 1
                last = char
            }
        }

        ump[last, default: []].append(count)

        for (_, v) in ump {
            var l1 = 0
            var l2 = 0
            var l3 = 0

            for e in v {
                if l1 < e {
                    (l3, l2, l1) = (l2, l1, e)
                } else if l2 < e {
                    (l3, l2) = (l2, e)
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
