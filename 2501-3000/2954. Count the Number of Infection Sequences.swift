let m = 100000
var fact = [Int](repeating: 0, count: m + 1)
var invFact = [Int](repeating: 0, count: m + 1)
let mod = 1_000_000_007
var initValue = false

class Solution {

    // Solution by Sergey Leschev
    // 2954. Count the Number of Infection Sequences

    func modPow(_ x: Int, _ y: Int, _ mod: Int) -> Int {
        if y == 0 {
            return 1
        }
        var p = modPow(x, y / 2, mod) % mod
        p = (p * p) % mod
        return y % 2 == 1 ? (p * x) % mod : p
    }

    func binomCoeff(_ n: Int, _ k: Int) -> Int {
        return max(1, (fact[n] * invFact[k]) % mod * invFact[n - k] % mod)
    }

    func numberOfSequence(_ n: Int, _ sick: [Int]) -> Int {
        if !initValue {
            initValue = true
            fact[0] = 1
            for i in 1...m {
                fact[i] = (fact[i - 1] * i) % mod
            }
            invFact[m] = modPow(fact[m], mod - 2, mod)
            for i in stride(from: m - 1, to: 0, by: -1) {
                invFact[i] = (invFact[i + 1] * (i + 1)) % mod
            }
        }

        var res: Int64 = 1
        for i in 1..<sick.count {
            let group = sick[i] - sick[i - 1] - 1
            res = (res * Int64(modPow(2, max(0, group - 1), mod))) % Int64(mod)  // combine
            res = (res * Int64(binomCoeff(sick[i] - i, group))) % Int64(mod)  // interweave
        }

        return Int(res * Int64(binomCoeff(n - sick.count, n - sick.last! - 1)) % Int64(mod))
    }
}
