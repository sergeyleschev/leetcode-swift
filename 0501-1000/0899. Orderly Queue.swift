class Solution {

    // Solution by Sergey Leschev

    // 899. Orderly Queue
    // A string s of lowercase letters is given.  Then, we may make any number of moves.
    // In each move, we choose one of the first k letters (starting from the left), remove it, and place it at the end of the string.
    // Return the lexicographically smallest string we could have after any number of moves.

    // Example 1:
    // Input: s = "cba", k = 1
    // Output: "acb"
    // Explanation: 
    // In the first move, we move the 1st character ("c") to the end, obtaining the string "bac".
    // In the second move, we move the 1st character ("b") to the end, obtaining the final result "acb".

    // Example 2:
    // Input: s = "baaca", k = 3
    // Output: "aaabc"
    // Explanation: 
    // In the first move, we move the 1st character ("b") to the end, obtaining the string "aacab".
    // In the second move, we move the 3rd character ("c") to the end, obtaining the final result "aaabc".

    // Note:
    // 1 <= k <= s.length <= 1000
    // s consists of lowercase letters only.

    func orderlyQueue(_ s: String, _ k: Int) -> String {
        guard k != 1 else { return getAnsOnKEqualToOne(of: s) }
        return String(s.sorted())
    }


    private func getAnsOnKEqualToOne(of s: String) -> String {
        var ans = s
        var s1 = s
        
        for _ in 0..<s.count {
            s1.append(s1.removeFirst())
            if s1 < ans { ans = s1 }
        }
        
        return ans
    }

}