class Solution {

    // Solution by Sergey Leschev
    // 2938. Separate Black and White Balls
    // Two Pointers

    func minimumSteps(_ s: String) -> Int {
        var res = 0
        var j = 0

        for (i, char) in s.enumerated() {
            if char == "0" {
                res += i - j
                j += 1
            }
        }

        return res
    }
}
