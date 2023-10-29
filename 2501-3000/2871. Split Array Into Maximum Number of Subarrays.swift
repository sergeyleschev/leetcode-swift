class Solution {

    // Solution by Sergey Leschev
    // 2871. Split Array Into Maximum Number of Subarrays

    func maxSubarrays(_ nums: [Int]) -> Int {
        var res = 0
        var cur = 0

        for n in nums {
            cur = cur == 0 ? n : cur & n
            res += cur == 0 ? 1 : 0
        }

        return max(1, res)
    }
}
