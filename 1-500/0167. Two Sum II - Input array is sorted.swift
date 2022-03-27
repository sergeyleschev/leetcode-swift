class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 167. Two Sum II - Input array is sorted
    // Given an array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.
    // Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.
    // The tests are generated such that there is exactly one solution. You may not use the same element twice.

    // Example 1:
    // Input: numbers = [2,7,11,15], target = 9
    // Output: [1,2]
    // Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
    
    // Example 2:
    // Input: numbers = [2,3,4], target = 6
    // Output: [1,3]
    
    // Example 3:
    // Input: numbers = [-1,0], target = -1
    // Output: [1,2]

    // Constraints:
    // 2 <= numbers.length <= 3 * 10^4
    // -1000 <= numbers[i] <= 1000
    // numbers is sorted in non-decreasing order.
    // -1000 <= target <= 1000
    // The tests are generated such that there is exactly one solution.

    // Finds two numbers such that they add up to a specific target number.

    // - Parameters:
    //   - numbers: An array of integers sorted in ascending order.
    //   - target: Specific target number.
    // - Returns: Indices of the two numbers such that they add up to the target, where index1 must be less than index2.

    // - Complexity:
    //   - time: O(n), where n is the length of the numbers.
    //   - space: O(1), only constant space is used.
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else { return [] }
        var i = 0
        var j = numbers.count - 1

        while i < j {
            guard numbers[i] + numbers[j] != target else { break }

            if numbers[i] + numbers[j] > target {
                j -= 1
            } else {
                i += 1
            }
        }

        return [i + 1, j + 1]
    }

}