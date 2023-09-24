class Solution {

    // Solution by Sergey Leschev
    // 2864. Maximum Odd Binary Number
    // O(n)

    func maximumOddBinaryNumber(_ s: String) -> String {
        let n = s.count
        var cnt = 0
        var str = ""

        for char in s {
            if char == "1" {
                cnt += 1
            }
            str += "0"
        }

        let t = cnt - 1

        for _ in 0..<t {
            if let index = str.firstIndex(of: "0") {
                str.replaceSubrange(index...index, with: "1")
            }
        }

        if let lastIndex = str.lastIndex(of: "0") {
            str.replaceSubrange(lastIndex...lastIndex, with: "1")
        }

        return str
    }
}
