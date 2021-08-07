class Solution {

    // 1819. Number of Different Subsequences GCDs
    // You are given an array nums that consists of positive integers.
    // The GCD of a sequence of numbers is defined as the greatest integer that divides all the numbers in the sequence evenly.
    // For example, the GCD of the sequence [4,6,16] is 2.
    // A subsequence of an array is a sequence that can be formed by removing some elements (possibly none) of the array.
    // For example, [2,5,10] is a subsequence of [1,2,1,2,4,1,5,10].
    // Return the number of different GCDs among all non-empty subsequences of nums.

    // Example 1:
    // Input: nums = [6,10,3]
    // Output: 5
    // Explanation: The figure shows all the non-empty subsequences and their GCDs.
    // The different GCDs are 6, 10, 3, 2, and 1.

    // Example 2:
    // Input: nums = [5,15,40,5,6]
    // Output: 7

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 2 * 10^5

    func countDifferentSubsequenceGCDs(_ nums: [Int]) -> Int {
        var cnt = 0
        let max = nums.max()!
        var numbers = [Bool](repeating: false, count: max + 1)
        for num in nums { numbers[num] = true }
        
        for i in 1...max {
            guard !numbers[i] else { cnt += 1; continue }
            var gcd = 0
            var b = i

            while b <= max  {
                if numbers[b] { gcd = f(gcd, b) }
                b += i
            }
            if gcd == i { cnt += 1 }
        }
        return cnt
    }
    

    private func f(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else { return a }
        return a % b == 0 ? b : f(b, a % b)
    }

}