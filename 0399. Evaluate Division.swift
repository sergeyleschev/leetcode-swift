class Solution {

    // 399. Evaluate Division
    // You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.
    // You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.
    // Return the answers to all queries. If a single answer cannot be determined, return -1.0.
    // Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

    // Evaluates division for given equations.

    // - Parameters:
    //   - equations: The equations in the format A / B = k.
    //   - values: The values.
    //   - queries: The queries.
    // - Returns: The answers, if the answer does not exist return -1.0.

    // Example 1:
    // Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
    // Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
    // Explanation: 
    // Given: a / b = 2.0, b / c = 3.0
    // queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
    // return: [6.0, 0.5, -1.0, 1.0, -1.0 ]

    // Example 2:
    // Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
    // Output: [3.75000,0.40000,5.00000,0.20000]

    // Example 3:
    // Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
    // Output: [0.50000,2.00000,-1.00000,-1.00000]

    // Constraints:
    // 1 <= equations.length <= 20
    // equations[i].length == 2
    // 1 <= Ai.length, Bi.length <= 5
    // values.length == equations.length
    // 0.0 < values[i] <= 20.0
    // 1 <= queries.length <= 20
    // queries[i].length == 2
    // 1 <= Cj.length, Dj.length <= 5
    // Ai, Bi, Cj, Dj consist of lower case English letters and digits.

    // - Complexity:
    //   - time: O((n + m) log(n)), where n is the number of equations and m is the number of queries.
    //   - space: O(n), where n is the number of equations.

    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var gidWeight = [String: (key: String, value: Double)]()
        var ans = [Double]()

        for (i, equation) in equations.enumerated() {
            union(&gidWeight, dividend: equation[0], divisor: equation[1], value: values[i])
        }

        for querie in queries {
            if !gidWeight.keys.contains(querie[0]) || !gidWeight.keys.contains(querie[1]) {
                ans.append(-1.0)

            } else {
                let dividendEntry = find(&gidWeight, querie[0])
                let divisorEntry = find(&gidWeight, querie[1])

                if dividendEntry.key != divisorEntry.key {
                    ans.append(-1.0)
                } else {
                    ans.append(dividendEntry.value / divisorEntry.value)
                }
            }
        }

        return ans
    }


    private func union(_ gidWeight: inout [String: (key: String, value: Double)], dividend: String, divisor: String, value: Double) {
        let dividendEntry = find(&gidWeight, dividend)
        let divisorEntry = find(&gidWeight, divisor)

        guard dividendEntry.key != divisorEntry.key else { return }
        gidWeight[dividendEntry.key] = (divisorEntry.key, divisorEntry.value * value / dividendEntry.value)
    }


    private func find(_ gidWeight: inout [String: (key: String, value: Double)], _ nodeID: String) -> (key: String, value: Double) {
        if !gidWeight.keys.contains(nodeID) { gidWeight[nodeID] = (nodeID, 1.0) }

        let entry = gidWeight[nodeID] ?? (nodeID, 1.0)

        guard entry.key != nodeID else { return entry }
        let newEntry = find(&gidWeight, entry.key)
        gidWeight[nodeID] = (newEntry.key, entry.value * newEntry.value)

        return gidWeight[nodeID] ?? (nodeID, 1.0)
    }

}