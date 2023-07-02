class Solution {

    // Solution by Sergey Leschev
    // 2565. Subsequence With the Minimum Score

    func minimumScore(_ s: String, _ t: String) -> Int {
        let sArray = Array(s)
        let tArray = Array(t)
        var lo = 0
        var hi = t.count
        while lo <= hi {
            let m = (lo + hi) >> 1
            if check(sArray, tArray, m) {
                hi = m - 1
            } else {
                lo = m + 1
            }
        }
        return hi + 1
    }

    private func check(_ s: [Character], _ t: [Character], _ len: Int) -> Bool {
        let tLength = t.count
        let n = s.count
        if len >= tLength {
            return true  // delete whole t array
        }
        var pos = [Int](repeating: 1_000_000_0, count: tLength)  // Greedy left matching
        var tLeftIndex = 0
        for i in 0..<n {
            if tLeftIndex == tLength {
                break
            }
            if t[tLeftIndex] == s[i] {
                pos[tLeftIndex] = i
                tLeftIndex += 1
            }
        }
        if tLeftIndex >= tLength - len {
            return true  // we can delete right subarray of length len
        }
        var rightIndexOfS = n - 1
        var rp = tLength - 1
        while rp >= len {
            while rightIndexOfS >= 0 && s[rightIndexOfS] != t[rp] {
                rightIndexOfS -= 1
            }
            if rightIndexOfS == -1 {
                return false
            }
            let lp = rp - len - 1
            if lp == -1 || pos[lp] < rightIndexOfS {
                return true
            }
            rightIndexOfS -= 1
            rp -= 1
        }
        return false
    }
}
