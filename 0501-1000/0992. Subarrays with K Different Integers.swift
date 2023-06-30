class Solution {

    // Solution by Sergey Leschev

    // 992. Subarrays with K Different Integers
    // Given an array nums of positive integers, call a (contiguous, not necessarily distinct) subarray of nums good if the number of different integers in that subarray is exactly k.
    // (For example, [1,2,3,1,2] has 3 different integers: 1, 2, and 3.)
    // Return the number of good subarrays of nums.

    // Example 1:
    // Input: nums = [1,2,1,2,3], k = 2
    // Output: 7
    // Explanation: Subarrays formed with exactly 2 different integers: [1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2].

    // Example 2:
    // Input: nums = [1,2,1,3,4], k = 3
    // Output: 3
    // Explanation: Subarrays formed with exactly 3 different integers: [1,2,1,3], [2,1,3], [1,3,4].

    // Note:
    // 1 <= nums.length <= 20000
    // 1 <= nums[i] <= nums.length
    // 1 <= k <= nums.length

    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        let k1 = subarraysWithAtMostKDistinct(A, K)
        let k2 = subarraysWithAtMostKDistinct(A, K - 1)
        let ans = k1 - k2
        
        return ans
    }
    

    private func subarraysWithAtMostKDistinct(_ A: [Int], _ K: Int) -> Int {
        var left = 0
        var right = 0
        var map: [Int: Int] = [:]
        var ans = 0
        
        while right < A.count {
            let rightVal = A[right]
            map[rightVal] = (map[rightVal] ?? 0) + 1
            right += 1
            while map.keys.count > K {
                let leftVal = A[left]
                map[leftVal]! -= 1
                if map[leftVal] == 0 { map.removeValue(forKey: leftVal) }
                left += 1
            }
            ans += (right - left)
        }
        
        return ans
    }
    
}