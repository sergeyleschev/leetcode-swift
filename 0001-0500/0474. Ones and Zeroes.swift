class Solution {

    // Solution by Sergey Leschev

    // 474. Ones and Zeroes
    // You are given an array of binary strings strs and two integers m and n.
    // Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.
    // A set x is a subset of a set y if all elements of x are also elements of y.

    // Example 1:
    // Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
    // Output: 4
    // Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
    // Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
    // {"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.

    // Example 2:
    // Input: strs = ["10","0","1"], m = 1, n = 1
    // Output: 2
    // Explanation: The largest subset is {"0", "1"}, so the answer is 2.

    // Constraints:
    // 1 <= strs.length <= 600
    // 1 <= strs[i].length <= 100
    // strs[i] consists only of digits '0' and '1'.
    // 1 <= m, n <= 100

    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var counts: [(Int, Int)] = []
        var memo: [String: Int] = [:]

        
        for s in strs {
            var zero = 0, one = 0
            for c in s {
                if c == "0" { zero += 1 }
                else { one += 1 }
            }
            counts.append((zero, one))
        }
        
        
        func dfs(_ index: Int, _ zero: Int, _ one: Int) -> Int {
            if index == 0 { return zero >= counts[0].0 && one >= counts[0].1 ? 1 : 0 }
            if index < 0 || zero < 0 || one < 0 { return 0 }
            
            let key = "\(index)_\(zero)_\(one)"
            if memo[key] != nil { return memo[key]! }
            
            if zero >= counts[index].0 && one >= counts[index].1 {
                memo[key] = max(1 + dfs(index - 1, zero - counts[index].0, one - counts[index].1), dfs(index - 1, zero, one))
            } else {
                memo[key] = dfs(index - 1, zero, one)
            }

            return memo[key]!
        }
        
        return dfs(strs.count - 1, m, n)
    }

}