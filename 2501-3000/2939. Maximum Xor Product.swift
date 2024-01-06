class Solution {

    // Solution by Sergey Leschev
    // 2939. Maximum Xor Product

    // Time complexity: O(N)
    // Space complexity: O(1)

    func maximumXorProduct(_ a: Int, _ b: Int, _ n: Int) -> Int {
        let mod = 1_000_000_007
        var a = a
        var b = b

        for i in (0..<n).reversed() {
            let mask = 1 << i
            if (a & mask) != 0 && (b & mask) != 0 {
                continue
            } else if (a & mask) != 0 {
                if a > b {
                    a ^= mask
                    b |= mask
                }
                continue
            } else if (b & mask) != 0 {
                if a < b {
                    a |= mask
                    b ^= mask
                }
            } else {
                a |= mask
                b |= mask
            }
        }

        a %= mod
        b %= mod

        return (a * b) % mod
    }
}
