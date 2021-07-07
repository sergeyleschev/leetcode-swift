class Solution {

    // 1306. Jump Game III
    // Given an array of non-negative integers arr, you are initially positioned at start index of the array. When you are at index i, you can jump to i + arr[i] or i - arr[i], check if you can reach to any index with value 0.
    // Notice that you can not jump outside of the array at any time.

    // Checks if you can reach any index with value 0.

    // - Parameters:
    //   - arr: An array of non-negative integers.
    //   - start: Start index.
    // - Returns: True if index with value 0 can be reached, otherwise returns false.

    // Example 1:
    // Input: arr = [4,2,3,0,3,1,2], start = 5
    // Output: true
    // Explanation: 
    // All possible ways to reach at index 3 with value 0 are: 
    // index 5 -> index 4 -> index 1 -> index 3 
    // index 5 -> index 6 -> index 4 -> index 1 -> index 3 

    // Example 2:
    // Input: arr = [4,2,3,0,3,1,2], start = 0
    // Output: true 
    // Explanation: 
    // One possible way to reach at index 3 with value 0 is: 
    // index 0 -> index 4 -> index 1 -> index 3

    // Example 3:
    // Input: arr = [3,0,2,1,2], start = 2
    // Output: false
    // Explanation: There is no way to reach at index 1 with value 0.

    // Constraints:
    // 1 <= arr.length <= 5 * 10^4
    // 0 <= arr[i] < arr.length
    // 0 <= start < arr.length

    // - Complexity:
    //   - time: O(n), where n is the length of the arr.
    //   - space: O(n), where n is the length of the arr.
    
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arr = arr
        return dfs(&arr, arr.count, start)
    }


    private func dfs(_ arr: inout [Int], _ n: Int, _ start: Int) -> Bool {
        guard start >= 0, start < n, arr[start] >= 0 else { return false }
        guard arr[start] != 0 else { return true }

        arr[start] = -arr[start]
        return dfs(&arr, n, start + arr[start]) || dfs(&arr, n, start - arr[start])
    }

}