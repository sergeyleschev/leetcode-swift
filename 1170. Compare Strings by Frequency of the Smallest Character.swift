class Solution {

    // 1170. Compare Strings by Frequency of the Smallest Character
    // Let the function f(s) be the frequency of the lexicographically smallest character in a non-empty string s. For example, if s = "dcce" then f(s) = 2 because the lexicographically smallest character is 'c', which has a frequency of 2.
    // You are given an array of strings words and another array of query strings queries. For each query queries[i], count the number of words in words such that f(queries[i]) < f(W) for each W in words.
    // Return an integer array answer, where each answer[i] is the answer to the ith query.

    // Example 1:
    // Input: queries = ["cbd"], words = ["zaaaz"]
    // Output: [1]
    // Explanation: On the first query we have f("cbd") = 1, f("zaaaz") = 3 so f("cbd") < f("zaaaz").

    // Example 2:
    // Input: queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
    // Output: [1,2]
    // Explanation: On the first query only f("bbb") < f("aaaa"). On the second query both f("aaa") and f("aaaa") are both > f("cc").

    // Constraints:
    // 1 <= queries.length <= 2000
    // 1 <= words.length <= 2000
    // 1 <= queries[i].length, words[i].length <= 10
    // queries[i][j], words[i][j] consist of lowercase English letters.

    func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
        let queries = queries.map { f($0) }
        let words = words.map { f($0) }.sorted()
        var ans = [Int]()
        
        for query in queries {
            var num = 0
            for i in 0..<words.count where query < words[i] { num = words.count - i; break }
            ans.append(num)
        }

        return ans
    }
    
    
    private func f(_ string: String) -> Int {
        var c = "z", val = 0
        let characters = Array(string).map { String($0) }
        
        for character in characters {
            if character == c {
                val += 1
            } else if character < c {
                c = character
                val = 1
            }
        }
        return val
    }

}