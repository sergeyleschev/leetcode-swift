class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 22. Generate Parentheses
    // Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

    // Example 1:
    // Input: n = 3
    // Output: ["((()))","(()())","(())()","()(())","()()()"]

    // Example 2:
    // Input: n = 1
    // Output: ["()"]
     
    // Constraints:
    // 1 <= n <= 8

    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []


        func backtrack(_ path: [String], _ target: Int) {
            var path = path
            var count = 0

            if path.count == n * 2 {
                var string = ""
                for s in path { string += s }
                res.append(string)
                return
            }

            for c in path where c == "(" { count += 1 }
            for c in ["(", ")"] {
                if (c == "(" && count >= n) || (c == ")" && path.count - count >= count)  { continue }
                path.append(c)
                backtrack(path, target - 1)
                path.remove(at: path.count - 1)
            }
        }

        backtrack([], n * 2)
        return res
    }

}