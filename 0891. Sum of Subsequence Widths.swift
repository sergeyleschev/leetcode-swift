class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 891. Sum of Subsequence Widths
    // Given an array of integers nums, consider all non-empty subsequences of nums.
    // For any sequence seq, let the width of seq be the difference between the maximum and minimum element of seq.
    // Return the sum of the widths of all subsequences of nums. 
    // As the answer may be very large, return the answer modulo 10^9 + 7.

    // Example 1:
    // Input: nums = [2,1,3]
    // Output: 6
    // Explanation:
    // Subsequences are [1], [2], [3], [2,1], [2,3], [1,3], [2,1,3].
    // The corresponding widths are 0, 0, 0, 1, 1, 2, 2.
    // The sum of these widths is 6.

    // Note:
    // 1 <= nums.length <= 20000
    // 1 <= nums[i] <= 20000

    private let mod = 1_000_000_007


    func sumSubseqWidths(_ A: [Int]) -> Int {
        var ans = 0
        let N = A.count
        let sortedA = A.sorted()
        var powTwo = [1]
        
        for _ in 1..<N { powTwo.append(powTwo.last! * 2 % mod) }
        for i in 0..<N { ans = (ans + (powTwo[i] - powTwo[N - 1 - i]) * sortedA[i]) % mod }
        return ans
    }
    
}