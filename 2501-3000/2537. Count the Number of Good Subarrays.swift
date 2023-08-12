class Solution {

    // Solution by Sergey Leschev
    // 2537. Count the Number of Good Subarrays
    // Sliding Window

    // # Intuition
    // To tackle this problem, let's start by considering how we can determine pairs (i, j) in an array.

    // # Approach
    // We can employ the sliding window technique. Create a dictionary named count to keep track of the frequency of each element in the array.
    // When we introduce a new number A[j] at the right side of the window, we would have count[A[j]] occurrences of A[j] within the window. Consequently, we'll have count[A[j]] additional pairs.
    // If the number of pairs exceeds k, we can adjust the window size by reducing it. We continue this process until the number of pairs within the sliding window becomes less than k. When that happens, the subarray A[i]...A[j] no longer qualifies as a good subarray. However, for any index i2 where i2 < i, the subarray A[i2]...A[j] still remains a good subarray. Consequently, we can increment the result res by i for i2 = 0, 1, 2, ..., i-1.

    // Time complexity: O(n)
    // Space complexity: O(n)

    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var res: Int = 0
        var count: [Int: Int] = [:]
        var remainingPairs: Int = k  // Create a mutable copy

        var i: Int = 0

        for j in 0..<nums.count {
            if count[nums[j]] == nil {
                count[nums[j]] = 0
            }

            remainingPairs -= count[nums[j]]!
            count[nums[j]]! += 1

            while remainingPairs <= 0 {
                remainingPairs += (count[nums[i]]! - 1)
                count[nums[i]]! -= 1
                i += 1
            }

            res += i
        }

        return res
    }
}
