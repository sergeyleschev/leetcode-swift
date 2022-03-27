class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 239. Sliding Window Maximum
    // You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
    
    // Return the max sliding window.

    // - Parameters:
    //   - nums: An array of integers.
    //   - k: A sliding window size.
    // - Returns: The max sliding window.

    // Example 1:
    // Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
    // Output: [3,3,5,5,6,7]
    // Explanation: 
    // Window position                Max
    // ---------------               -----
    // [1  3  -1] -3  5  3  6  7       3
    //  1 [3  -1  -3] 5  3  6  7       3
    //  1  3 [-1  -3  5] 3  6  7       5
    //  1  3  -1 [-3  5  3] 6  7       5
    //  1  3  -1  -3 [5  3  6] 7       6
    //  1  3  -1  -3  5 [3  6  7]      7
    
    // Example 2:
    // Input: nums = [1], k = 1
    // Output: [1]

    // Example 3:
    // Input: nums = [1,-1], k = 1
    // Output: [1,-1]

    // Example 4:
    // Input: nums = [9,11], k = 2
    // Output: [11]

    // Example 5:
    // Input: nums = [4,-2], k = 2
    // Output: [4]
     
    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^4 <= nums[i] <= 10^4
    // 1 <= k <= nums.length

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        guard k != 1 else { return nums }
        var ans = [Int]()

        var left = [Int](repeating: 0, count: n)
        left[0] = nums[0]
        var right = [Int](repeating: 0, count: n)
        right[n - 1] = nums[n - 1]

        for i in 1..<n {
            if i % k == 0 {
                left[i] = nums[i]
            } else {
                left[i] = max(left[i-1], nums[i])
            }

            let j = n - i - 1
            if (j + 1) % k == 0 {
                right[j] = nums[j]
            } else {
                right[j] = max(right[j + 1], nums[j])
            }
        }

        for i in 0..<(n - k + 1) {
            ans.append(max(left[i + k - 1], right[i]))
        }

        return ans
    }

}