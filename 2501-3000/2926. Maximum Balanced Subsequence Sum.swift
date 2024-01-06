class Solution {

    // Solution by Sergey Leschev
    // 2926. Maximum Balanced Subsequence Sum

    func maxBalancedSubsequenceSum(_ nums: [Int]) -> Int {
        var comp = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if num > 0 {
                comp[num - index] = 0
            }
        }

        if comp.isEmpty {
            return nums.max() ?? 0
        }

        var cnt = 0
        var sz = comp.count
        var t = [Int](repeating: 0, count: sz + 1)

        for (key, value) in comp.sorted(by: { $0.key < $1.key }) {
            comp[key] = cnt
            cnt += 1
        }

        for i in 0..<nums.count {
            let num = nums[i]
            if num > 0 {
                let n = comp[num - i]!
                var val = 0

                var bi = n + 1
                while bi > 0 {
                    val = max(val, t[bi])
                    bi -= bi & -bi
                }

                bi = n + 1
                while bi < sz + 1 {
                    t[bi] = max(t[bi], val + num)
                    bi += bi & -bi
                }
            }
        }

        return t.max() ?? 0
    }
}
