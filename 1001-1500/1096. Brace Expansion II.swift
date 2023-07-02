class Solution {

    // Solution by Sergey Leschev

    // 1096. Brace Expansion II
    // Under the grammar given below, strings can represent a set of lowercase words. Let's use R(expr) to denote the set of words the expression represents.
    // Grammar can best be understood through simple examples:
    // Single letters represent a singleton set containing that word.
    // R("a") = {"a"}
    // R("w") = {"w"}
    // When we take a comma-delimited list of two or more expressions, we take the union of possibilities.
    // R("{a,b,c}") = {"a","b","c"}
    // R("{{a,b},{b,c}}") = {"a","b","c"} (notice the final set only contains each word at most once)
    // When we concatenate two expressions, we take the set of possible concatenations between two words where the first word comes from the first expression and the second word comes from the second expression.
    // R("{a,b}{c,d}") = {"ac","ad","bc","bd"}
    // R("a{b,c}{d,e}f{g,h}") = {"abdfg", "abdfh", "abefg", "abefh", "acdfg", "acdfh", "acefg", "acefh"}
    // Formally, the three rules for our grammar:
    // For every lowercase letter x, we have R(x) = {x}.
    // For expressions e1, e2, ... , ek with k >= 2, we have R({e1, e2, ...}) = R(e1) ∪ R(e2) ∪ ...
    // For expressions e1 and e2, we have R(e1 + e2) = {a + b for (a, b) in R(e1) × R(e2)}, where + denotes concatenation, and × denotes the cartesian product.
    // Given an expression representing a set of words under the given grammar, return the sorted list of words that the expression represents.

    // Example 1:
    // Input: expression = "{a,b}{c,{d,e}}"
    // Output: ["ac","ad","ae","bc","bd","be"]

    // Example 2:
    // Input: expression = "{{a,z},a{b,c},{ab,z}}"
    // Output: ["a","ab","ac","z"]
    // Explanation: Each distinct word is written only once in the final answer.

    // Constraints:
    // 1 <= expression.length <= 60
    // expression[i] consists of '{', '}', ','or lowercase English letters.
    // The given expression represents a set of words based on the grammar given in the description.

    // - Complexity:
    //   - time: O(n + mlogm)
    //   - space: O(n^3)

    func braceExpansionII(_ expression: String) -> [String] {
        //expression = {component, component, ...} OR'ed together
        //component = {component_part, component_part ...} CROSS'ed together
        //component_part = letters | expression
        var list = [[[String]]]()
        list.append([[String]]())
        var level = 0
        var start = -1
        var end = -1
        var expression = Array(expression)
        var set = Set<String>()

        for i in 0..<expression.count {
            let char = expression[i]
            if char == "{" {
                if level == 0 { start = i + 1 }
                level += 1
            } else if char == "}" {
                level -= 1
                if level == 0 {
                    // recursive check its subExpression
                    let sub = String(expression[start..<i])
                    let subList = braceExpansionII(sub)
                    list[list.count - 1].append(subList)
                }
            } else if char == "," && level == 0 {
                list.append([[String]]())
            } else if level == 0 {
                list[list.count - 1].append([String(char)])
            }
        }

        for subList in list {
            var temp = [""]
            for sub in subList {
                var tempSub = [String]()
                for stri in temp {
                    for strj in sub { tempSub.append(stri + strj) }
                }
                temp = tempSub
            }
            set = set.union(temp)
        }

        return set.sorted()
    }

}
