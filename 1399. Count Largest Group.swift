class Solution {

    // 1399. Count Largest Group
    // Given an integer n. Each number from 1 to n is grouped according to the sum of its digits. 
    // Return how many groups have the largest size.

    // Example 1:
    // Input: n = 13
    // Output: 4
    // Explanation: There are 9 groups in total, they are grouped according sum of its digits of numbers from 1 to 13:
    // [1,10], [2,11], [3,12], [4,13], [5], [6], [7], [8], [9]. There are 4 groups with largest size.

    // Example 2:
    // Input: n = 2
    // Output: 2
    // Explanation: There are 2 groups [1], [2] of size 1.

    // Example 3:
    // Input: n = 15
    // Output: 6

    // Example 4:
    // Input: n = 24
    // Output: 5

    // Constraints:
    // 1 <= n <= 10^4

    func countLargestGroup(_ n: Int) -> Int {
        var ans = 0
        var counter = [Int: Int]()

        for i in 1...n {
            var temp = i
            var sum = 0
            while temp > 0 {
                sum += temp % 10
                temp /= 10
            }
            counter.updateValue((counter[sum] ?? 0) + 1, forKey: sum)
        }

        let maxGroupSize = counter.values.max()!    
        for (_, val) in counter where val == maxGroupSize { ans += 1 }
        return ans
    }

}