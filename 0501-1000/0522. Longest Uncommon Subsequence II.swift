class Solution {

    // Solution by Sergey Leschev

    // 522. Longest Uncommon Subsequence II
    // Given an array of strings strs, return the length of the longest uncommon subsequence between them. If the longest uncommon subsequence does not exist, return -1.
    // An uncommon subsequence between an array of strings is a string that is a subsequence of one string but not the others.
    // A subsequence of a string s is a string that can be obtained after deleting any number of characters from s.
    // For example, "abc" is a subsequence of "aebdc" because you can delete the underlined characters in "aebdc" to get "abc". Other subsequences of "aebdc" include "aebdc", "aeb", and "" (empty string).

    // Example 1:
    // Input: strs = ["aba","cdc","eae"]
    // Output: 3

    // Example 2:
    // Input: strs = ["aaa","aaa","aa"]
    // Output: -1

    // Constraints:
    // 1 <= strs.length <= 50
    // 1 <= strs[i].length <= 10
    // strs[i] consists of lowercase English letters.

    func findLUSlength(_ strs: [String]) -> Int {
        var dict = [String: Int]()


        func isSubstring(s: String, t: String) -> Bool {
            var arr1 = Array(s)
            var arr2 = Array(t)
            var index1 = 0
            var index2 = 0
            while index1 < arr1.count && index2 < arr2.count {
                if arr1[index1] == arr2[index2] { index1 += 1 }
                index2 += 1
            }
            return index1 == arr1.count
        }
        

        for str in strs { dict[str] = (dict[str] ?? 0) + 1 }
        let sortStrs = strs.sorted{ $0.count > $1.count }
        for (i, s) in sortStrs.enumerated() {
            guard dict[s] == 1 else { continue }
            var flag = true
            for j in 0..<i {
                if isSubstring(s: s, t: sortStrs[j]) { flag = false; break }
            }
            if flag { return s.count }
        }
        
        return -1
    }

}