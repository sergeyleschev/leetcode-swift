class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 896. Monotonic Array
    // An array is monotonic if it is either monotone increasing or monotone decreasing.
    // An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j].  An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].
    // Return true if and only if the given array nums is monotonic.

    // Example 1:
    // Input: nums = [1,2,2,3]
    // Output: true

    // Example 2:
    // Input: nums = [6,5,4,4]
    // Output: true

    // Example 3:
    // Input: nums = [1,3,2]
    // Output: false

    // Example 4:
    // Input: nums = [1,2,4,5]
    // Output: true

    // Example 5:
    // Input: nums = [1,1,1]
    // Output: true 

    // Note:
    // 1 <= nums.length <= 50000
    // -100000 <= nums[i] <= 100000

    func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count > 2 else { return true }
        var isDec: Bool = false
        var isInc: Bool = false
        
        for i in 1..<A.count {
            let dif = A[i] - A[i-1]
            if dif < 0 { isDec = true }
            if dif > 0 { isInc = true }
        }
        
        return !(isDec && isInc)
    }
    
}