class Solution {

    // Solution by Sergey Leschev
    // 2844. Minimum Operations to Make a Special Number

    func minimumOperations(_ num: String) -> Int {
        let n = num.count
        var ans = n

        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: i - 1, through: 0, by: -1) {
                let digitI = Int(String(num[num.index(num.startIndex, offsetBy: i)])) ?? 0
                let digitJ = Int(String(num[num.index(num.startIndex, offsetBy: j)])) ?? 0
                let t = digitI + digitJ * 10
                if t % 25 == 0 {
                    ans = min(ans, n - j - 2)
                }
            }
            if num[num.index(num.startIndex, offsetBy: i)] == "0" {
                ans = min(ans, n - 1)
            }
        }

        return ans
    }
}
