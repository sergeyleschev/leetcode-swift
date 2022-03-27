class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 912. Sort an Array
    // Given an array of integers nums, sort the array in ascending order.

    // Example 1:
    // Input: nums = [5,2,3,1]
    // Output: [1,2,3,5]

    // Example 2:
    // Input: nums = [5,1,1,2,0,0]
    // Output: [0,0,1,1,2,5]

    // Constraints:
    // 1 <= nums.length <= 5 * 10^4
    // -5 * 10^4 <= nums[i] <= 5 * 10^4

    // - Complexity:
    //   - time: O(nlogn)
    //   - space: O(n)

    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        return mergeSort(nums, 0, nums.count - 1)
    }

    
    private func mergeSort(_ nums: [Int], _ start: Int, _ end: Int) -> [Int] {
        guard end > start else { return [nums[start]] }
        var res: [Int] = []
        let mid = start + (end - start) / 2
        var left = mergeSort(nums, start, mid)
        var right = mergeSort(nums, mid + 1, end)

        while let n1 = left.first, let n2 = right.first {
            if n1 < n2 {
                res.append(left.removeFirst())
            } else {
                res.append(right.removeFirst())
            }
        }
        
        return res + left + right
    }

}