class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 961. N-Repeated Element in Size 2N Array
    // In a array nums of size 2 * n, there are n + 1 unique elements, and exactly one of these elements is repeated n times.
    // Return the element repeated n times.

    // Example 1:
    // Input: nums[1,2,3,3]
    // Output: 3

    // Example 2:
    // Input: nums[2,1,2,5,3,2]
    // Output: 2

    // Example 3:
    // Input: nums[5,1,5,2,5,3,5,4]
    // Output: 5

    // Note:
    // 4 <= nums.length <= 10000
    // 0 <= nums[i] < 10000
    // nums.length is even

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func repeatedNTimes(_ A: [Int]) -> Int {
        let map = A.reduce(into: [:]) { dict, num in dict[num, default: 0] += 1 }

        for num in A {
            if let count = map[num], count > 1 { return num }
        }

        return -1
    }
    
}