class Solution {

    // Solution by Sergey Leschev
    // 2856. Minimum Array Length After Pair Removals

    // Time complexity: O(n)
    // Space complexity: O(n)

    func minLengthAfterRemovals(_ nums: [Int]) -> Int {
        var mp = [Int: Int]()
        for i in nums {
            mp[i, default: 0] += 1
        }

        var maxi = 0
        for (_, count) in mp {
            maxi = max(maxi, count)
        }

        let n = nums.count
        if maxi <= n / 2 {
            if n % 2 == 1 {
                return 1
            } else {
                return 0
            }
        }

        return 2 * maxi - n
    }
}
