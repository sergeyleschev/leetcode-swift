class Solution {

    // Solution @ Sergey Leschev

    // 962. Maximum Width Ramp
    // Given an array nums of integers, a ramp is a tuple (i, j) for which i < j and nums[i] <= nums[j].  The width of such a ramp is j - i.
    // Find the maximum width of a ramp in nums.  If one doesn't exist, return 0.

    // Example 1:
    // Input: nums = [6,0,8,2,1,5]
    // Output: 4
    // Explanation: 
    // The maximum width ramp is achieved at (i, j) = (1, 5): nums[1] = 0 and nums[5] = 5.

    // Example 2:
    // Input: nums = [9,8,1,0,1,9,4,0,4,1]
    // Output: 7
    // Explanation: 
    // The maximum width ramp is achieved at (i, j) = (2, 9): nums[2] = 1 and nums[9] = 1.

    // Note:
    // 2 <= nums.length <= 50000
    // 0 <= nums[i] <= 50000

    func maxWidthRamp(_ A: [Int]) -> Int {
        var mono = [Int]()
        var ans = 0

        // construct a monotonic decreasing sequence starting from A[0]
        // we can prove that the sequence must contain the lower end of the max-width ramp
        // since every elements on the left of the end is larger than it
        for i in A.indices where mono.isEmpty || A[i] < A[mono.last!] { mono.append(i) }

        // find the higher end in reversed order
        for j in A.indices.reversed() {
            while !mono.isEmpty, A[mono.last!] <= A[j] {
                ans = max(ans, j - mono.last!)
                mono.removeLast() // we have obtained the best result whose lower end is at mono.last
            }
        }

        return ans
    }

}