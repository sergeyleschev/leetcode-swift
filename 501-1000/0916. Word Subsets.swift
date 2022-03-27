class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 916. Word Subsets
    // We are given two arrays words1 and words2 of words.  Each word is a string of lowercase letters.
    // Now, say that word b is a subset of word a if every letter in b occurs in a, including multiplicity.  For example, "wrr" is a subset of "warrior", but is not a subset of "world".
    // Now say a word a from words1 is universal if for every b in words2, b is a subset of a. 
    // Return a list of all universal words in words1.  You can return the words in any order.

    // Example 1:
    // Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["e","o"]
    // Output: ["facebook","google","leetcode"]

    // Example 2:
    // Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["l","e"]
    // Output: ["apple","google","leetcode"]

    // Example 3:
    // Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["e","oo"]
    // Output: ["facebook","google"]

    // Example 4:
    // Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["lo","eo"]
    // Output: ["google","leetcode"]

    // Example 5:
    // Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["ec","oc","ceo"]
    // Output: ["facebook","leetcode"]

    // Note:
    // 1 <= words1.length, words2.length <= 10000
    // 1 <= words1[i].length, words2[i].length <= 10
    // words1[i] and words2[i] consist only of lowercase letters.
    // All words in words1[i] are unique: there isn't i != j with words1[i] == words1[j].

    // Solution: build memoB for recording char accurs in B iteratively check each a to see if a char array cover memoB.
    
    // - Complexity:
    //   - time: O(B.count + A.count)
    //   - space: O(1), only constant space is used.

    func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
        let asciiA = Character("a").asciiValue!
        var memoB = Array(repeating: 0, count: 26)
        var temp = Array(repeating: 0, count: 26)
        var isUniversal = true
        var res = [String]()

        for b in B {
            temp = Array(repeating: 0, count: 26)
            for c in b { temp[Int(c.asciiValue! - asciiA)] += 1 }
            for i in 0..<26 { memoB[i] = max(memoB[i], temp[i]) }
        }

        for a in A {
            temp = Array(repeating: 0, count: 26)
            for c in a { temp[Int(c.asciiValue! - asciiA)] += 1 }

            isUniversal = true
            for i in 0..<26 where temp[i] < memoB[i] { isUniversal = false; break }

            if isUniversal { res.append(a) }
        }

        return res
    }

}