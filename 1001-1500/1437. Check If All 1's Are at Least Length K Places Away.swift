class Solution {

    // Solution @ Sergey Leschev

    // 1437. Check If All 1's Are at Least Length K Places Away
    // Given an array nums of 0s and 1s and an integer k, return True if all 1's are at least k places away from each other, otherwise return False.

    // Checks if all 1's are at least length `k` places away.

    // - Parameters:
    //   - nums: An array of 0s and 1s.
    //   - k: An integer.
    // - Returns: True if all 1's are at least k places away from each other, otherwise returns false.

    // Example 1:
    // Input: nums = [1,0,0,0,1,0,0,1], k = 2
    // Output: true
    // Explanation: Each of the 1s are at least 2 places away from each other.

    // Example 2:
    // Input: nums = [1,0,0,1,0,1], k = 2
    // Output: false
    // Explanation: The second 1 and third 1 are only one apart from each other.

    // Example 3:
    // Input: nums = [1,1,1,1,1], k = 0
    // Output: true

    // Example 4:
    // Input: nums = [0,1,0,1], k = 1
    // Output: true

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 0 <= k <= nums.length
    // nums[i] is 0 or 1

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.   
    
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0 else { return true }
        var i: Int?
        
        for (j, num) in nums.enumerated() {
            guard num == 1 else { continue }
            if let prev = i, j - prev <= k { return false }
            i = j
        }
        
        return true
    }

}