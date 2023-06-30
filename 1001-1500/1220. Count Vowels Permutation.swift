class Solution {

    // Solution by Sergey Leschev

    // 1220. Count Vowels Permutation
    // Given an integer n, your task is to count how many strings of length n can be formed under the following rules:
    // Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
    // Each vowel 'a' may only be followed by an 'e'.
    // Each vowel 'e' may only be followed by an 'a' or an 'i'.
    // Each vowel 'i' may not be followed by another 'i'.
    // Each vowel 'o' may only be followed by an 'i' or a 'u'.
    // Each vowel 'u' may only be followed by an 'a'.
    // Since the answer may be too large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: n = 1
    // Output: 5
    // Explanation: All possible strings are: "a", "e", "i" , "o" and "u".

    // Example 2:
    // Input: n = 2
    // Output: 10
    // Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".

    // Example 3: 
    // Input: n = 5
    // Output: 68

    // Constraints:
    // 1 <= n <= 2 * 10^4

    private let mod = 1_000_000_007
    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 1 else { return n == 0 ? 0 : 5 }
        var cnt: [Character: Int] = [:]

        "aeiou".forEach { cnt[$0] = 1}
        
        for _ in 2...n {
            var new = [Character:Int]()
            for (ch,val) in cnt {
                switch ch {
                case "a": new["e", default: 0 ] += val
                case "e": new["a", default: 0 ] += val
                          new["i", default: 0 ] += val
                case "i": new["a", default: 0 ] += val
                          new["e", default: 0 ] += val
                          new["o", default: 0 ] += val
                          new["u", default: 0 ] += val
                case "o": new["i", default: 0 ] += val
                          new["u", default: 0 ] += val
                case "u": new["a", default: 0 ] += val
                default: break
                }
            }

            for (ch,v) in new { new[ch] = v % mod }
            cnt = new
        }
        
        return  cnt.values.reduce(0) { $0 + $1 } % mod
    }

}