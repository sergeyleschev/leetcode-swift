class Solution {

    // Solution @ Sergey Leschev

    // 839. Similar String Groups
    // Two strings X and Y are similar if we can swap two letters (in different positions) of X, so that it equals Y. Also two strings X and Y are similar if they are equal.
    // For example, "tars" and "rats" are similar (swapping at positions 0 and 2), and "rats" and "arts" are similar, but "star" is not similar to "tars", "rats", or "arts".
    // Together, these form two connected groups by similarity: {"tars", "rats", "arts"} and {"star"}.  Notice that "tars" and "arts" are in the same group even though they are not similar.  Formally, each group is such that a word is in the group if and only if it is similar to at least one other word in the group.
    // We are given a list strs of strings where every string in strs is an anagram of every other string in strs. How many groups are there?

    // Example 1:
    // Input: strs = ["tars","rats","arts","star"]
    // Output: 2

    // Example 2:
    // Input: strs = ["omv","ovm"]
    // Output: 1

    // Constraints:
    // 1 <= strs.length <= 300
    // 1 <= strs[i].length <= 300
    // strs[i] consists of lowercase letters only.
    // All words in strs have the same length and are anagrams of each other.
    
    private var union: [Int] = []
    private var setCount: Int = 0
    
    
    func numSimilarGroups(_ strs: [String]) -> Int {
        let n = strs.count
        let count = strs[0].count
        
        setCount = n
        for i in 0..<n { union.append(i) }
        
        for i in 0..<strs.count {
            for j in i + 1..<strs.count {
                let f1 = find(i)
                let f2 = find(j)
                if f1 == f2 { continue }
                let a = strs[i]
                let b = strs[j]
                if isSimilar(a, b, count) {
                    union[f1] = f2
                    setCount -= 1
                }
            }
        }
        return setCount
    }
    
    
    private func find(_ i: Int) -> Int {
        if union[i] != i { union[i] = find(union[i]) }
        return union[i]
    }
    
    
    private func isSimilar(_ str1: String, _ str2: String, _ count: Int) -> Bool {
        var str1 = Array(str1)
        var str2 = Array(str2)
        var cnt = 0
        for i in 0..<count where str1[i] != str2[i] { cnt += 1 }
        return cnt <= 2
    }

}

