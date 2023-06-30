class Solution {

    // Solution by Sergey Leschev

    // 990. Satisfiability of Equality Equations
    // Given an array equations of strings that represent relationships between variables, each string equations[i] has length 4 and takes one of two different forms: "a==b" or "a!=b".  Here, a and b are lowercase letters (not necessarily different) that represent one-letter variable names.
    // Return true if and only if it is possible to assign integers to variable names so as to satisfy all the given equations.

    // Example 1:
    // Input: ["a==b","b!=a"]
    // Output: false
    // Explanation: If we assign say, a = 1 and b = 1, then the first equation is satisfied, but not the second.  There is no way to assign the variables to satisfy both equations.

    // Example 2:
    // Input: ["b==a","a==b"]
    // Output: true
    // Explanation: We could assign a = 1 and b = 1 to satisfy both equations.

    // Example 3:
    // Input: ["a==b","b==c","a==c"]
    // Output: true

    // Example 4:
    // Input: ["a==b","b!=c","c==a"]
    // Output: false

    // Example 5:
    // Input: ["c==c","b==d","x!=z"]
    // Output: true

    // Note:
    // 1 <= equations.length <= 500
    // equations[i].length == 4
    // equations[i][0] and equations[i][3] are lowercase letters
    // equations[i][1] is either '=' or '!'
    // equations[i][2] is '='

    func equationsPossible(_ equations: [String]) -> Bool {
        var equals: [Set<Character>] = []
        var unequals: [[Character]] = []
        var record: [Character: Int] = [:]
        
        for equation in equations {
            let equation = [Character](equation)
            let a = equation[0], b = equation[3], symbal = equation[1]
            if symbal == "=" {
                let i1 = record[a], i2 = record[b]
                if i1 == nil && i2 == nil {
                    equals.append(.init([a, b]))
                    record[a] = equals.count-1
                    record[b] = equals.count-1
                } else if i1 == nil {
                    equals[i2!].insert(a)
                    equals[i2!].insert(b)
                    record[a] = i2!
                } else if i2 == nil {
                    equals[i1!].insert(a)
                    equals[i1!].insert(b)
                    record[a] = i1!
                } else if i1 != i2 {
                    for c in equals[i2!] {
                        record[c] = i1!
                        equals[i1!].insert(c)
                    }
                }
                if let idx = (record[a] ?? record[b]) {
                    equals[idx].insert(a)
                    equals[idx].insert(b)
                    record[a] = idx
                    record[b] = idx
                }
            } else {
                if equation[0] == equation[3] { return false }
                unequals.append([equation[0],equation[3]])
            }
        }
        
        for unequal in unequals {
            let a = unequal[0], b = unequal[1]
            if let i1 = record[a], let i2 = record[b], i1 == i2 { return false }
        }
        
        return true
    }
    
}