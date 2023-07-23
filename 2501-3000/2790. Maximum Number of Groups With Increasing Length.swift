class Solution {

    // Solution by Sergey Leschev
    // 2790. Maximum Number of Groups With Increasing Length

    // # Approach

    // 1. `Sorting the usageLimits array`: The first step is to sort the input array usageLimits in ascending order. Sorting takes O(NlogN) time complexity, where N is the length of the usageLimits array.

    // 2. `Tracking the total and count`: The total variable is used to keep track of the cumulative sum of elements in the sorted usageLimits array. The count variable represents the number of groups created so far that satisfy the conditions.

    // 3. `Iterating through the sorted array`: The function iterates through the sorted array using a for loop. For each element at index i, it adds the value to the total. The purpose of the total is to keep track of the total number of allowed occurrences across all groups formed so far.

    // 4. `Checking the conditions`: After adding an element to the total, the function checks whether the current total value is greater than or equal to the required sum for the next group. The required sum for the next group is calculated as ((count + 1) * (count + 2)) / 2. Here, count + 1 represents the next group's length, and (count + 2) / 2 represents the sum of elements from 0 to count + 1. If the total is greater than or equal to this required sum, it means that we can create another group satisfying the conditions.

    // 5. `Incrementing the count`: If the condition in step 4 is true, the count is incremented, indicating that another group can be formed.

    // 6. `Returning the result`: After iterating through the entire sorted array, the count variable will represent the maximum number of groups that can be created while satisfying the conditions. The function returns this count.

    // Time Complexity: O(N logN)
    // The `time complexity` of this solution is dominated by the sorting step, making it O(N logN), where N is the length of the input array usageLimits. The rest of the operations involve simple arithmetic and comparisons, which take linear time. Therefore, the overall time complexity of the function is O(N logN).

    func maxIncreasingGroups(_ usageLimits: [Int]) -> Int {
        var sortedLimits = usageLimits.sorted()
        var total = 0
        var count = 0

        for i in 0..<sortedLimits.count {
            total += sortedLimits[i]
            if total >= ((count + 1) * (count + 2)) / 2 {
                count += 1
            }
        }

        return count
    }
}
