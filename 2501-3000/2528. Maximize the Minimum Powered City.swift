class Solution {

    // Solution by Sergey Leschev
    // 2528. Maximize the Minimum Powered City

    func maxPower(_ stations: [Int], _ r: Int, _ k: Int) -> Int {
        let n = stations.count
        var a = Array(repeating: 0, count: n + 1)

        for i in 0..<n {
            let l = max(i - r, 0)
            let x = min(i + r, n - 1)
            a[l] += stations[i]
            a[x + 1] -= stations[i]
        }

        for i in 1..<n {
            a[i] += a[i - 1]
        }

        var hi: Int64 = Int64.max
        var lo: Int64 = 0
        var ans: Int64 = 0

        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            var add = Array(repeating: Int64(0), count: n + 1)
            var rem = Int64(k)

            for i in 0..<n {
                if i > 0 {
                    add[i] += add[i - 1]
                }

                let got = Int64(a[i]) + add[i]

                if got < mid {
                    let need = mid - got
                    rem -= need
                    if rem < 0 {
                        break
                    }
                    let j = min(i + r + r, n - 1)
                    add[i] += need
                    add[j + 1] -= need
                }
            }

            if rem >= 0 {
                ans = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        return Int(ans)
    }
}
