class Solution {

    // Solution by Sergey Leschev

    // 1287. Element Appearing More Than 25% In Sorted Array
    // Given an integer array sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time, return that integer.

    // Example 1:
    // Input: arr = [1,2,2,6,6,6,6,7,10]
    // Output: 6

    // Example 2:
    // Input: arr = [1,1]
    // Output: 1

    // Constraints:
    // 1 <= arr.length <= 10^4
    // 0 <= arr[i] <= 10^5

    // Two-pointer approach

    func findSpecialInteger(_ arr: [Int]) -> Int {
        guard arr.count > 1 else { return arr[0] }
        var occurances = 1
        
        for index in 1..<arr.count {
            let current = arr[index]
            let prev = arr[index - 1]
            
            if current == prev {
                occurances += 1
            } else {
                occurances = 1
            }

            if occurances * 4 > arr.count { return current }
        }

        return Int.min
    }

}