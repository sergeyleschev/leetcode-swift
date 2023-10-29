class Solution {

    // Solution by Sergey Leschev
    // 2902. Count of Sub-Multisets With Bounded Sum
    // Dynamic Programming

    // Time complexity: O(r * min(n, sqrt(sum(nums))), where n = len(nums)
    // Space complexity: O(r + min(n, sqrt(sum(nums)))

    let MOD = 1_000_000_007

    func countSubMultisets(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var numsMap = [Int: Int]()
        for num in nums {
            numsMap[num, default: 0] += 1
        }

        var cache = Array(repeating: 0, count: r + 1)
        cache[0] = 1

        for (num, freq) in numsMap.sorted(by: { $0.key < $1.key }) {
            var pSum = cache

            for i in 0...r {
                if i >= num {
                    pSum[i] += pSum[i - num]
                    pSum[i] %= MOD
                }
            }

            for i in (0...r).reversed() {
                if num > 0 {
                    let j = i - (freq + 1) * num
                    cache[i] = (pSum[i] - (j >= 0 ? pSum[j] : 0)) % MOD
                    cache[i] = (cache[i] + MOD) % MOD
                } else {
                    cache[i] = (cache[i] * (freq + 1)) % MOD
                }
            }
        }

        var res: Int = 0
        for i in l...r {
            res = (res + cache[i]) % MOD
        }
        return res
    }
}
