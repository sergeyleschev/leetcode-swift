class Solution {

    // Solution by Sergey Leschev
    // 2516. Take K of Each Character From Left and Right

    func takeCharacters(_ s: String, _ k: Int) -> Int {
        var cnt = [0, 0, 0]
        let sArray = Array(s)
        let sz = s.count
        var res = -1

        for ch in sArray {
            cnt[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }

        if cnt.min()! < k {
            return -1
        }

        var j = 0
        for i in 0..<sz {
            cnt[Int(sArray[i].asciiValue! - Character("a").asciiValue!)] -= 1

            while cnt[Int(sArray[i].asciiValue! - Character("a").asciiValue!)] < k {
                cnt[Int(sArray[j].asciiValue! - Character("a").asciiValue!)] += 1
                j += 1
            }

            res = max(res, i - j + 1)
        }

        return sz - res
    }
}
