class Solution {
    
    // 215. Kth Largest Element in an Array
    // Given an integer array nums and an integer k, return the kth largest element in the array.
    // Note that it is the kth largest element in the sorted order, not the kth distinct element.

    // Finds the k-th largest element in an unsorted array.

    // - Parameters:
    //   - nums: The unsorted array.
    //   - k: An integer.
    // - Returns: The k-th largest element.

    // Example 1:
    // Input: nums = [3,2,1,5,6,4], k = 2
    // Output: 5

    // Example 2:
    // Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
    // Output: 4

    // Constraints:
    // 1 <= k <= nums.length <= 10^4
    // -10^4 <= nums[i] <= 10^4

    // - Complexity:
    //   - time: average O(n), the worst O(n^2), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.

    private var nums = [Int]()


    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        self.nums = nums
        let n = nums.count
        return quickselect(0, n - 1, n - k)
    }
    

    private func quickselect(_ left: Int, _ right: Int, _ kSmallest: Int) -> Int {
        guard left != right else { return nums[left] }
        
        var pivot = left + (right - left) / 2
        pivot = partition(left, right, pivot)
        
        if kSmallest < pivot {
            return quickselect(left, pivot - 1, kSmallest)
        } else if kSmallest > pivot {
            return quickselect(pivot + 1, right, kSmallest)
        }
        
        return nums[kSmallest]
    }
    
    
    private func partition(_ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
        let pivot = nums[pivotIndex]
        nums.swapAt(pivotIndex, right)
        var storeIndex = left
        
        for i in left..<right {
            guard nums[i] < pivot else { continue }
            nums.swapAt(storeIndex, i)
            storeIndex += 1
        }
        
        nums.swapAt(storeIndex, right)
        return storeIndex
    }

}