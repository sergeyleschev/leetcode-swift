class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 726. Number of Atoms
    // Given a chemical formula (given as a string), return the count of each atom.
    // The atomic element always starts with an uppercase character, then zero or more lowercase letters, representing the name.
    // One or more digits representing that element's count may follow if the count is greater than 1. If the count is 1, no digits will follow. For example, H2O and H2O2 are possible, but H1O2 is impossible.
    // Two formulas concatenated together to produce another formula. For example, H2O2He3Mg4 is also a formula.
    // A formula placed in parentheses, and a count (optionally added) is also a formula. For example, (H2O2) and (H2O2)3 are formulas.
    // Given a formula, return the count of all elements as a string in the following form: the first name (in sorted order), followed by its count (if that count is more than 1), followed by the second name (in sorted order), followed by its count (if that count is more than 1), and so on.

    // Example 1:
    // Input: formula = "H2O"
    // Output: "H2O"
    // Explanation: The count of elements are {'H': 2, 'O': 1}.

    // Example 2:
    // Input: formula = "Mg(OH)2"
    // Output: "H2MgO2"
    // Explanation: The count of elements are {'H': 2, 'Mg': 1, 'O': 2}.

    // Example 3:
    // Input: formula = "K4(ON(SO3)2)2"
    // Output: "K4N2O14S4"
    // Explanation: The count of elements are {'K': 4, 'N': 2, 'O': 14, 'S': 4}.

    // Example 4:
    // Input: formula = "Be32"
    // Output: "Be32"

    // Constraints:
    // 1 <= formula.length <= 1000
    // formula consists of English letters, digits, '(', and ')'.
    // formula is always valid.

    func countOfAtoms(_ formula: String) -> String {
        guard formula.count > 0 else { return formula }
        let chars = Array(formula)
        let res = helper(chars, 0)
        let ret = res.0.sorted(by: {$0.key < $1.key})
        var str = ""

        for (k,v) in ret {
            if v > 1 {
                str += "\(k)\(v)"
            } else {
                str += "\(k)"
            }
        }
        
        return str
    }

    
    func helper(_ chars: [Character], _ index: Int) -> ([String: Int], Int) {
        var res = [String: Int]()
        var stack = [[String: Int]]()
        var i = index
    
        while i < chars.count {
            let c = chars[i]
            
            if c == "(" {
                stack.append(res)
                res.removeAll()
                i += 1
            } else if c == ")" {
                var right =  i + 1
                var val = 0
                while right < chars.count && chars[right].isNumber {
                    val = val * 10 + Int(String(chars[right]))!
                    right += 1
                }
                if val == 0 { val = 1 }
                for (k,v) in res { res[k] = v * val }
                if !stack.isEmpty {
                    let tmp = stack.removeLast()
                    res.merge(tmp) { (v1, v2) -> Int in return v1 + v2 }
                }
                i = right
            
            } else {
                var right = i + 1
                while right < chars.count && chars[right].isLetter && chars[right].isLowercase { right += 1 }
                let atom = String(chars[i..<right])
                
                i = right
                var val = 0
                while i < chars.count && chars[i].isNumber {
                    val = val * 10 + Int(String(chars[i]))!
                    i += 1
                }
                if val == 0 { val = 1 }
                res[atom] = (res[atom] ?? 0) + val
            }
        }
        
        return (res, i)
    }

}