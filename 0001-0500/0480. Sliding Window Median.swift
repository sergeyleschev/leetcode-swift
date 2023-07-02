class Solution {

    // Solution by Sergey Leschev

    // 480. Sliding Window Median
    // The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle values.
    // For examples, if arr = [2,3,4], the median is 3.
    // For examples, if arr = [1,2,3,4], the median is (2 + 3) / 2 = 2.5.
    // You are given an integer array nums and an integer k. There is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
    // Return the median array for each window in the original array. Answers within 10-5 of the actual value will be accepted.

    // Example 1:
    // Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
    // Output: [1.00000,-1.00000,-1.00000,3.00000,5.00000,6.00000]
    // Explanation:
    // Window position                Median
    // ---------------                -----
    // [1  3  -1] -3  5  3  6  7        1
    //  1 [3  -1  -3] 5  3  6  7       -1
    //  1  3 [-1  -3  5] 3  6  7       -1
    //  1  3  -1 [-3  5  3] 6  7        3
    //  1  3  -1  -3 [5  3  6] 7        5
    //  1  3  -1  -3  5 [3  6  7]       6

    // Example 2:
    // Input: nums = [1,2,3,4,2,3,1,4,2], k = 3
    // Output: [2.00000,3.00000,3.00000,3.00000,2.00000,3.00000,2.00000]

    // Constraints:
    // 1 <= k <= nums.length <= 10^5
    // 2^31 <= nums[i] <= 2^31 - 1

    func getMedian(_ arr: inout [Int]) -> Double {
        if arr.count % 2 != 0 {
            return Double(arr[arr.count / 2])

        } else {
            return Double((Double(arr[arr.count / 2]) + Double(arr[arr.count / 2 - 1])) / 2.0)
        }
    }

    func binarySearch(_ num: Int, _ arr: inout [Int]) -> Int {
        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if num > arr[mid] {
                left = mid + 1
            } else if num < arr[mid] {
                right = mid - 1
            } else {
                left = mid
                break
            }
        }
        return left
    }

    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        guard nums.count > 0 else { return [] }
        var medians = [Double]()
        var slidingWindow = [Int]()

        for i in 0..<nums.count {
            if i < k {
                let idx = binarySearch(nums[i], &slidingWindow)
                slidingWindow.insert(nums[i], at: idx)

            } else {
                medians.append(getMedian(&slidingWindow))
                let removeIdx = binarySearch(nums[i - k], &slidingWindow)
                slidingWindow.remove(at: removeIdx)
                let insertIdx = binarySearch(nums[i], &slidingWindow)
                slidingWindow.insert(nums[i], at: insertIdx)
            }
        }

        medians.append(getMedian(&slidingWindow))
        return medians
    }

}
