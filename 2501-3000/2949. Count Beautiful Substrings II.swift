class Solution {

    // Solution by Sergey Leschev
    // 2949. Count Beautiful Substrings II

    // Time Complexity: O(n + k)
    // Space Complexity: O(n + k)

    func beautifulSubstrings(_ s: String, _ k: Int) -> Int {
        let n = s.count
        var v = 0
        var l = 1
        while l * l % (k * 4) != 0 {
            l += 1
        }

        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var seen = Array(repeating: [Int: Int](), count: l)
        seen[l - 1][0] = 1
        var res: Int64 = 0

        for (i, char) in s.enumerated() {
            v += vowels.contains(char) ? 1 : -1
            res += Int64(seen[i % l][v] ?? 0)
            seen[i % l][v, default: 0] += 1
        }

        return Int(res)
    }
}
