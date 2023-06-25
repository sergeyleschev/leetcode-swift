class Solution {

    // Solution @ Sergey Leschev
    
    // 338. Counting Bits
    // Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

    // Example 1:
    // Input: n = 2
    // Output: [0,1,1]
    // Explanation:
    // 0 --> 0
    // 1 --> 1
    // 2 --> 10

    // Example 2:
    // Input: n = 5
    // Output: [0,1,1,2,1,2]
    // Explanation:
    // 0 --> 0
    // 1 --> 1
    // 2 --> 10
    // 3 --> 11
    // 4 --> 100
    // 5 --> 101

    // Constraints:
    // 0 <= n <= 10^5
     
    // Follow up:
    // It is very easy to come up with a solution with a runtime of O(n log n). Can you do it in linear time O(n) and possibly in a single pass?
    // Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?

    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var ans = Array(repeating: 0, count: num + 1)

        for i in 1...num { ans[i] = ans[i & (i - 1)] + 1 }
        return ans
    }
    
    
    func stupid(_ num: Int) -> [Int] {
        var ans = [Int]()
        
        for i in 0...num {
            var val = i, count = 0
            while val > 1 {
                if val % 2 == 1 { count += 1 }
                val /= 2
            }
            if val == 1 { count += 1 }
            ans.append(count)
        }

        return ans
    }
    
}