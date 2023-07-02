class Solution {

    // Solution by Sergey Leschev

    // 1636. Sort Array by Increasing Frequency
    // Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.

    // Return the sorted array.

    // Example 1:
    // Input: nums = [1,1,2,2,2,3]
    // Output: [3,1,1,2,2,2]
    // Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.

    // Example 2:
    // Input: nums = [2,3,1,3,2]
    // Output: [1,3,3,2,2]
    // Explanation: '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.

    // Example 3:
    // Input: nums = [-1,1,-6,4,5,-6,1,4,1]
    // Output: [5,-1,4,4,-6,-6,1,1,1]

    // Constraints:
    // 1 <= nums.length <= 100
    // -100 <= nums[i] <= 100

    func frequencySort(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        var counter = [Int: Int]()
        for num in nums { counter[num, default: 0] += 1 }

        let sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            let (key0, value0) = arg0
            let (key1, value1) = arg1
            if value1 == value0 { return key0 > key1 }
            return value0 < value1
        }

        for (num, cnt) in sortedCounter {
            ans.append(contentsOf: [Int](repeating: num, count: cnt))
        }
        return ans
    }

}
