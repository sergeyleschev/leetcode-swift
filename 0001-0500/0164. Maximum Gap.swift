class Solution {

    // Solution @ Sergey Leschev

    // 164. Maximum Gap
    // Given an integer array nums, return the maximum difference between two successive elements in its sorted form. If the array contains less than two elements, return 0.
    // You must write an algorithm that runs in linear time and uses linear extra space.

    // Example 1:
    // Input: nums = [3,6,9,1]
    // Output: 3
    // Explanation: The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.

    // Example 2:
    // Input: nums = [10]
    // Output: 0
    // Explanation: The array contains less than 2 elements, therefore return 0.

    // Constraints:
    // 1 <= nums.length <= 10^4
    // 0 <= nums[i] <= 10^9

    func maximumGap(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count >= 2 else { return 0 }
        
        var minNum = nums[0], maxNum = nums[0]
        for n in nums {
            minNum = min(minNum, n)
            maxNum = max(maxNum, n)
        }
        
        let stride = max(1, (maxNum - minNum) / (count - 1))
        var buckets = Array(repeating: [-1, -1], count: (maxNum - minNum) / stride + 1)
        
        for n in nums {
            let i = (n - minNum) / stride
            if buckets[i][0] == -1 {
                buckets[i][0] = n
                buckets[i][1] = n
            } else {
                buckets[i][0] = min(buckets[i][0], n)
                buckets[i][1] = max(buckets[i][1], n)
            }
        }
        
        var gap = 0, prev = -1
        for i in 0..<buckets.count {
            if buckets[i][0] == -1 { continue }
            if prev != -1 {
                gap = max(gap, buckets[i][0] - buckets[prev][1])
            }
            prev = i
        }
        
        return gap
    }
    
}