class Solution {

    // Solution by Sergey Leschev
    // 2544. Alternating Digit Sum

    func alternateDigitSum(_ n: Int) -> Int {
        var res = 0
        var sign = 1
        var num = n

        while num > 0 {
            sign *= -1
            res += sign * (num % 10)
            num /= 10
        }

        return sign * res
    }
}
