class Solution {

    // Solution by Sergey Leschev
    // 2947. Count Beautiful Substrings I

    // Time complexity: O(n+k)
    // Space complexity: O(n)

    func beautifulSubstrings(_ s: String, _ k: Int) -> Int {
        var grps = [Int: [Int]]()
        grps[0] = [0]

        let vowels: Set<Character> = Set("aeiou")
        var presum = 0

        for (i, char) in s.enumerated() {
            if vowels.contains(char) {
                presum += 1
            } else {
                presum -= 1
            }
            grps[presum, default: []].append(i + 1)
        }

        var x = 1
        while x <= k && x * x % k != 0 {
            x += 1
        }
        x *= 2

        var ans: Int64 = 0
        for (_, grp) in grps {
            var mod = [Int](repeating: 0, count: x)
            for i in grp {
                ans += Int64(mod[i % x])
                mod[i % x] += 1
            }
        }
        return Int(ans)
    }
}
