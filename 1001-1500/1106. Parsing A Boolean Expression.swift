class Solution {

    // Solution by Sergey Leschev

    // 1106. Parsing A Boolean Expression
    // Return the result of evaluating a given boolean expression, represented as a string.
    // An expression can either be:
    // "t", evaluating to True;
    // "f", evaluating to False;
    // "!(expr)", evaluating to the logical NOT of the inner expression expr;
    // "&(expr1,expr2,...)", evaluating to the logical AND of 2 or more inner expressions expr1, expr2, ...;
    // "|(expr1,expr2,...)", evaluating to the logical OR of 2 or more inner expressions expr1, expr2, ...

    // Example 1:
    // Input: expression = "!(f)"
    // Output: true

    // Example 2:
    // Input: expression = "|(f,t)"
    // Output: true

    // Example 3:
    // Input: expression = "&(t,f)"
    // Output: false

    // Example 4:
    // Input: expression = "|(&(t,f,t),!(t))"
    // Output: false

    // Constraints:
    // 1 <= expression.length <= 20000
    // expression[i] consists of characters in {'(', ')', '&', '|', '!', 't', 'f', ','}.
    // expression is a valid expression representing a boolean, as given in the description.

    let operators = Set<Character>("!|&")

    func parseBoolExpr(_ expression: String) -> Bool {
        var stack = [Character]()

        for ch in expression {
            if ch.isLetter || operators.contains(ch) { stack.append(ch) }
            if ch == ")" {
                var temp = Set<Character>()
                while !operators.contains(stack.last!) { temp.insert(stack.removeLast()) }

                switch stack.removeLast() {
                case "|":
                    if temp.count == 2 || (temp.count == 1 && temp.first! == "t") {
                        stack.append("t")
                    } else {
                        stack.append("f")
                    }
                case "&":
                    if temp.count == 2 || (temp.count == 1 && temp.first! == "f") {
                        stack.append("f")
                    } else {
                        stack.append("t")
                    }
                default:
                    stack.append(temp.first! == "t" ? "f" : "t")
                }
            }
        }

        return stack.first! == "t" ? true : false
    }

}
