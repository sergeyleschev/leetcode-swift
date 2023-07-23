class Solution {

    // Solution by Sergey Leschev
    // 2240. Number of Ways to Buy Pens and Pencils

    func waysToBuyPensPencils(_ total: Int, _ cost1: Int, _ cost2: Int) -> Int {
        var res = 0
        for cnt in 0...(total / cost1) {
            res += (total - cnt * cost1) / cost2 + 1
        }
        return res
    }
}
