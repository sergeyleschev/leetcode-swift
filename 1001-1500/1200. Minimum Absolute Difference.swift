class Solution {

    // Solution by Sergey Leschev

    // 1200. Minimum Absolute Difference
    // Given an array of distinct integers arr, find all pairs of elements with the minimum absolute difference of any two elements.
    // Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows
    // a, b are from arr
    // a < b
    // b - a equals to the minimum absolute difference of any two elements in arr

    // Example 1:
    // Input: arr = [4,2,1,3]
    // Output: [[1,2],[2,3],[3,4]]
    // Explanation: The minimum absolute difference is 1. List all pairs with difference equal to 1 in ascending order.

    // Example 2:
    // Input: arr = [1,3,6,10,15]
    // Output: [[1,3]]

    // Example 3:
    // Input: arr = [3,8,-10,23,19,-4,-14,27]
    // Output: [[-14,-10],[19,23],[23,27]]

    // Constraints:
    // 2 <= arr.length <= 10^5
    // -10^6 <= arr[i] <= 10^6

    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let arr = arr.sorted(by: <)
        var i = 0
        var j = i + 1
        var minDiff = 0
        var ans = [[Int]]()

        while j < arr.count {
            let diff = arr[j] - arr[i]
            if i == 0 {
                minDiff = diff
            } else {
                minDiff = min(diff, minDiff)
            }
            i += 1
            j += 1
        }
        i = 0
        j = 1

        while j < arr.count {
            if arr[j] - arr[i] == minDiff { ans.append([arr[i], arr[j]]) }
            i += 1
            j += 1
        }

        return ans
    }

}
