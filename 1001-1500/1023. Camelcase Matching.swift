class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1023. Camelcase Matching
    // A query word matches a given pattern if we can insert lowercase letters to the pattern word so that it equals the query. (We may insert each character at any position, and may insert 0 characters.)
    // Given a list of queries, and a pattern, return an answer list of booleans, where answer[i] is true if and only if queries[i] matches the pattern.

    // Example 1:
    // Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FB"
    // Output: [true,false,true,true,false]
    // Explanation: 
    // "FooBar" can be generated like this "F" + "oo" + "B" + "ar".
    // "FootBall" can be generated like this "F" + "oot" + "B" + "all".
    // "FrameBuffer" can be generated like this "F" + "rame" + "B" + "uffer".

    // Example 2:
    // Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FoBa"
    // Output: [true,false,true,false,false]
    // Explanation: 
    // "FooBar" can be generated like this "Fo" + "o" + "Ba" + "r".
    // "FootBall" can be generated like this "Fo" + "ot" + "Ba" + "ll".

    // Example 3:
    // Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FoBaT"
    // Output: [false,true,false,false,false]
    // Explanation: 
    // "FooBarTest" can be generated like this "Fo" + "o" + "Ba" + "r" + "T" + "est".

    // Note:
    // 1 <= queries.length <= 100
    // 1 <= queries[i].length <= 100
    // 1 <= pattern.length <= 100
    // All strings consists only of lower and upper case English letters.

    func isValidPattern(_ s: String,_ pattern: String) -> Bool {
        var indexP = 0
        let arrP = Array(pattern)
        
        for c in s {
            if (c.isUppercase) {
                if (indexP == pattern.count) { return false }
                if (c != arrP[indexP]) { return false }
                indexP += 1
            } else {
                if indexP < arrP.count {
                    if (c == arrP[indexP]) { indexP += 1 }
                }
            }
        }
        return indexP == pattern.count
    }
    

    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        var results = [Bool]()
        for s in queries { results.append(isValidPattern(s, pattern)) }
        return results
    }
    
}