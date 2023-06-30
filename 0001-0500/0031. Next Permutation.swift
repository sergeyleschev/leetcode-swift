class Solution {

    // Solution by Sergey Leschev

    // 31. Next Permutation
    // Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
    // If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).
    // The replacement must be in place and use only constant extra memory.

    // Rearranges numbers into the lexicographically next greater permutation of numbers.

    // - Parameter nums: An array of numbers.

    // Example 1:
    // Input: nums = [1,2,3]
    // Output: [1,3,2]

    // Example 2:
    // Input: nums = [3,2,1]
    // Output: [1,2,3]

    // Example 3:
    // Input: nums = [1,1,5]
    // Output: [1,5,1]

    // Example 4:
    // Input: nums = [1]
    // Output: [1]
     
    // Constraints:
    // 1 <= nums.length <= 100
    // 0 <= nums[i] <= 100

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.
    
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var i = n - 2
        while i >= 0, nums[i + 1] <= nums[i] { i -= 1 }
        
        guard i >= 0 else {
            reverse(&nums, start: i + 1, end: n - 1)
            return
        }
        
        var j = n - 1
        while j >= 0, nums[j] <= nums[i] { j -= 1 }
        nums.swapAt(i, j)
        reverse(&nums, start: i + 1, end: n - 1)
    }
    

    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var i = start
        var j = end
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

}