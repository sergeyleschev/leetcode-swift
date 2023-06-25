class Solution {

    // Solution @ Sergey Leschev

    // 466. Count The Repetitions
    // We define str = [s, n] as the string str which consists of the string s concatenated n times.
    // For example, str == ["abc", 3] =="abcabcabc".
    // We define that string s1 can be obtained from string s2 if we can remove some characters from s2 such that it becomes s1.

    // For example, s1 = "abc" can be obtained from s2 = "abdbec" based on our definition by removing the bolded underlined characters.
    // You are given two strings s1 and s2 and two integers n1 and n2. You have the two strings str1 = [s1, n1] and str2 = [s2, n2].

    // Return the maximum integer m such that str = [str2, m] can be obtained from str1.

    // Example 1:
    // Input: s1 = "acb", n1 = 4, s2 = "ab", n2 = 2
    // Output: 2

    // Example 2:
    // Input: s1 = "acb", n1 = 1, s2 = "acb", n2 = 1
    // Output: 1 

    // Constraints:
    // 1 <= s1.length, s2.length <= 100
    // s1 and s2 consist of lowercase English letters.
    // 1 <= n1, n2 <= 10^6
    
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {    
        guard s1.count > 0 else { return 0 }
        let a1 = Array(s1)
        let a2 = Array(s2)
        var dp = [[Int]]()
        var start = 0
        var res = 0
        var next = 0
        
        for i in 0..<s2.count {
            start = i
            var count = 0
            for j in 0..<s1.count {
                if a1[j] == a2[start] {
                    start += 1
                    if start == s2.count {
                        start = 0
                        count += 1
                    }
                }
            }
            dp.append([start, count])
        }
        
        for _ in 0..<n1 {
            res += dp[next][1]
            next = dp[next][0]
        }
        
        return res / n2
    }

}