class Solution {

    // Solution by Sergey Leschev
    // 2800. Shortest String That Contains Three Strings
    // Time complexity: O(n^2)
    // Space complexity: O(n)

    private func merge(_ s1: String, _ s2: String) -> String {
        if s1.contains(s2) {
            return s1
        }

        for i in s1.indices {
            if s2.starts(with: s1[i...]) {
                return String(s1[..<i]) + s2
            }
        }

        return s1 + s2
    }

    func minimumString(_ a: String, _ b: String, _ c: String) -> String {
        var res = ""
        var l = Int.max

        for s in [
            merge(merge(a, b), c),
            merge(merge(b, a), c),
            merge(merge(c, b), a),
            merge(merge(b, c), a),
            merge(merge(a, c), b),
            merge(merge(c, a), b),
        ] {
            if s.count < l {
                res = s
                l = s.count
            } else if s.count == l {
                res = min(res, s)
            }
        }

        return res
    }
}
