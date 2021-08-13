class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 41. First Missing Positive
    // Given an unsorted integer array nums, find the smallest missing positive integer.
    // You must implement an algorithm that runs in O(n) time and uses constant extra space.

    // Finds the smallest missing positive integer.

    // - Parameter nums: An unsorted integer array.
    // - Returns: The smallest missing positive integer.

    // Example 1:
    // Input: nums = [1,2,0]
    // Output: 3

    // Example 2:
    // Input: nums = [3,4,-1,1]
    // Output: 2

    // Example 3:
    // Input: nums = [7,8,9,11,12]
    // Output: 1
     
    // Constraints:
    // 1 <= nums.length <= 5 * 10^5
    // -2^31 <= nums[i] <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the length of the `nums`.
    //   - space: O(1), only constant space is used, if we have parameter `nums` as inout.

    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var ans = 1

        for (i, num) in nums.enumerated() {
            if num == ans { ans += 1 }
            if num <= 0 || num > nums.count { nums[i] = 1 }
        }

        guard ans != 1, ans != nums.count + 1 else { return ans }

        for i in 0..<nums.count {
            let num = abs(nums[i])

            if num == nums.count {
                nums[0] = -abs(nums[0])
            } else {
                nums[num] = -abs(nums[num])
            }
        }

        for i in 1..<nums.count {
            guard nums[i] > 0 else { continue }
            return i
        }

        return nums.count + (nums[0] > 0 ? 0 : 1)
    }
    
    
    /*
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var map: [Int: Bool] = [:]
        var i = 1
        
        for num in nums {
            if num <= 0 {
                continue
            }
            map[num] = true
        }

        while true {
            if let _ = map[i] {
                i += 1
                continue
            } else {
                return i
            }
        }
    }
    */

}