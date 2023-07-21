class Solution {

    // Solution by Sergey Leschev
    // 2780. Minimum Index of a Valid Split.swift

    func minimumIndex(_ nums: [Int]) -> Int {
        // Find the majority element
        var majority = nums[0]
        var count = 0

        for n in nums {
            if n == majority {
                count += 1
            } else {
                count -= 1
            }

            if count == 0 {
                majority = n
                count = 1
            }
        }

        // Count the majority element's occurrence
        var majCount = 0
        for n in nums {
            if n == majority {
                majCount += 1
            }
        }

        // Check if split is possible or not
        count = 0
        for i in 0..<nums.count {
            if nums[i] == majority {
                count += 1
            }

            if count * 2 > (i + 1) && (majCount - count) * 2 > (nums.count - i - 1) {
                return i
            }
        }

        return -1
    }
}
