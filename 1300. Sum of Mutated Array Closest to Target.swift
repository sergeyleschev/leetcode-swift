class Solution {

    // 1300. Sum of Mutated Array Closest to Target
    // Given an integer array arr and a target value target, return the integer value such that when we change all the integers larger than value in the given array to be equal to value, the sum of the array gets as close as possible (in absolute difference) to target.
    // In case of a tie, return the minimum such integer.
    // Notice that the answer is not neccesarilly a number from arr.

    // Example 1:
    // Input: arr = [4,9,3], target = 10
    // Output: 3
    // Explanation: When using 3 arr converts to [3, 3, 3] which sums 9 and that's the optimal answer.

    // Example 2:
    // Input: arr = [2,3,5], target = 10
    // Output: 5

    // Example 3:
    // Input: arr = [60864,25176,27249,21296,20204], target = 56803
    // Output: 11361

    // Constraints:
    // 1 <= arr.length <= 10^4
    // 1 <= arr[i], target <= 10^5

    // - Complexity:
    //   - time: O(NlogN)
    //   - space: O(N)


    func findBestValue(_ arr: [Int], _ target: Int) -> Int {
        var sortArr = arr
        var sum = 0

        sortArr.sort()

        for i in 0..<sortArr.count {
            let x = (target - sum) / (sortArr.count - i)
            if x < sortArr[i] {
                let dbx = Double((target - sum)) / Double((sortArr.count - i))
                if (dbx - Double(x)) > 0.5 {
                    return x + 1
                } else {
                    return x
                }

            }

            sum += sortArr[i]
        }

        return sortArr[sortArr.count - 1]
    }

}