class Solution {

    // Solution by Sergey Leschev
    // 2663. Lexicographically Smallest Beautiful String

    func smallestBeautifulString(_ s: String, _ k: Int) -> String {
        var ch = Array(s.utf8)
        var i = ch.count - 1
        
        while i >= 0 {
            ch[i] += 1
            if ch[i] - 97 == k {
                i -= 1
            } else if (i - 1 < 0 || ch[i - 1] != ch[i]) && (i - 2 < 0 || ch[i - 2] != ch[i]) {
                break
            }
        }
        
        if i < 0 {
            return ""
        }
        
        for j in (i + 1)..<ch.count {
            var set: Set<UInt8> = [97, 98, 99]
            if j - 2 >= 0 {
                set.remove(ch[j - 2])
            }
            if j - 1 >= 0 {
                set.remove(ch[j - 1])
            }
            ch[j] = set.min()!
        }
        
        return String(bytes: ch, encoding: .utf8)!
    }
}