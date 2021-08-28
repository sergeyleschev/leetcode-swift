class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 667. Beautiful Arrangement II
    // Given two integers n and k, construct a list answer that contains n different positive integers ranging from 1 to n and obeys the following requirement:
    // Suppose this list is answer = [a1, a2, a3, ... , an], then the list [|a1 - a2|, |a2 - a3|, |a3 - a4|, ... , |an-1 - an|] has exactly k distinct integers.
    // Return the list answer. If there multiple valid answers, return any of them.

    // Example 1:
    // Input: n = 3, k = 1
    // Output: [1,2,3]
    // Explanation: The [1,2,3] has three different positive integers ranging from 1 to 3, and the [1,1] has exactly 1 distinct integer: 1

    // Example 2:
    // Input: n = 3, k = 2
    // Output: [1,3,2]
    // Explanation: The [1,3,2] has three different positive integers ranging from 1 to 3, and the [2,1] has exactly 2 distinct integers: 1 and 2.

    // Constraints:
    // 1 <= k < n <= 10^4

    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var p = 1
        var q = n
        var res = [Int](repeating: 0, count: n)
        var useP = true        
        guard k > 1 else { return res.enumerated().map { $0.0 + 1 } }

        for i in 0 ..< k {
            if i % 2 == 0 {
                res[i] = p
                p += 1
                useP = false
            } else{
                res[i] = q
                q -= 1
                useP = true
            }
        }

        var u = useP == true ? q : p
        
        for i in k ..< n {
            res[i] = u
            if useP == false {
                u += 1
            }
            else {
                u -= 1
            }
        }
        
        return res
    }

}