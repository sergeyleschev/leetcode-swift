class Solution {

    // Solution by Sergey Leschev
    // 2514. Count Anagrams

    let mod = 1_000_000_007
    var fact = [Int](repeating: 0, count: 100_002)

    func modmul(_ a: Int, _ b: Int) -> Int {
        return ((a % mod) * (b % mod)) % mod
    }

    func binExpo(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return 1
        }
        var res = binExpo(a, b / 2)
        res = modmul(res, res)
        if b % 2 == 1 {
            return modmul(a, res)
        } else {
            return res
        }
    }

    func modmulinv(_ a: Int) -> Int {
        return binExpo(a, mod - 2)
    }

    func getfact() {
        fact[0] = 1
        for i in 1...100_001 {
            fact[i] = modmul(fact[i - 1], i)
        }
    }

    func ways(_ str: String) -> Int {
        var freq = [Int](repeating: 0, count: 26)
        for char in str {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            freq[index] += 1
        }
        var totalWays = fact[str.count]
        var factR = 1
        for i in 0..<26 {
            factR = modmul(factR, fact[freq[i]])
        }
        return modmul(totalWays, modmulinv(factR))
    }

    func countAnagrams(_ s: String) -> Int {
        getfact()
        let words = s.split(separator: " ")
        var ans = 1
        for word in words {
            ans = modmul(ans, ways(String(word)))
        }
        return ans
    }
}
