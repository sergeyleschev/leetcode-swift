class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 982. Triples with Bitwise AND Equal To Zero
    // Given an array of integers nums, find the number of triples of indices (i, j, k) such that:
    // 0 <= i < nums.length
    // 0 <= j < nums.length
    // 0 <= k < nums.length
    // nums[i] & nums[j] & nums[k] == 0, where & represents the bitwise-AND operator.

    // Example 1:
    // Input: nums = [2,1,3]
    // Output: 12
    // Explanation: We could choose the following i, j, k triples:
    // (i=0, j=0, k=1) : 2 & 2 & 1
    // (i=0, j=1, k=0) : 2 & 1 & 2
    // (i=0, j=1, k=1) : 2 & 1 & 1
    // (i=0, j=1, k=2) : 2 & 1 & 3
    // (i=0, j=2, k=1) : 2 & 3 & 1
    // (i=1, j=0, k=0) : 1 & 2 & 2
    // (i=1, j=0, k=1) : 1 & 2 & 1
    // (i=1, j=0, k=2) : 1 & 2 & 3
    // (i=1, j=1, k=0) : 1 & 1 & 2
    // (i=1, j=2, k=0) : 1 & 3 & 2
    // (i=2, j=0, k=1) : 3 & 2 & 1
    // (i=2, j=1, k=0) : 3 & 1 & 2

    // Note:
    // 1 <= nums.length <= 1000
    // 0 <= nums[i] < 216

    func countTriplets(_ nums: [Int]) -> Int {
        var ans = 0
        var counter = [Int](repeating: 0, count: 1 << 16)
        
        for i in nums {
            for j in nums { counter[i & j] += 1 }
        }

        for num in nums {
            let bit = (~num) & 0xffff
            var j = bit
            while j > 0 {
                ans += counter[j]
                j = (j - 1) & bit
            }
            ans += counter[0]
        }
        
        return ans
    }
    
}