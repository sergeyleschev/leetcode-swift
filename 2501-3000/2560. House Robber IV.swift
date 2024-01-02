class Solution {

    // Solution by Sergey Leschev
    // 2560. House Robber IV

    // Time Complexity: O(nlogm),
    // where m is the range of A[i]
    // Space Complexity:  O(1)

    // We can also binary search the value in sorted(set(A)),
    // Time Complexity O(nlogn),
    // Space Complexity:  O(n).

    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        var l = nums.min()!
        var r = nums.max()!

        while l < r {
            let m = (l + r) / 2
            var last = 0
            var take = 0

            for a in nums {
                if last == 1 {
                    last = 0
                    continue
                }

                if a <= m {
                    take += 1
                    last = 1
                }
            }

            if take >= k {
                r = m
            } else {
                l = m + 1
            }
        }

        return l
    }
}
