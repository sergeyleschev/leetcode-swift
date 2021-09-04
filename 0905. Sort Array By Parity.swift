class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 905. Sort Array By Parity
    // Given an array nums of non-negative integers, return an array consisting of all the even elements of nums, followed by all the odd elements of nums.
    // You may return any answer array that satisfies this condition.

    // Returns an array consisting of all the even elements of A, followed by all the odd elements of A.

    // - Parameter A: The array.
    // - Returns: All the even elements of A, followed by all the odd elements of A.

    // Example 1:
    // Input: nums = [3,1,2,4]
    // Output: [2,4,3,1]
    // The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.

    // Note:
    // 1 <= nums.length <= 5000
    // 0 <= nums[i] <= 5000

    // - Complexity:
    //   - time: O(n), where n is the length of A.
    //   - space: O(n), where n is the length of A.
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var ans = A
        var i = 0
        var j = ans.count - 1

        while i < j {
            if ans[i] % 2 > ans[j] % 2 { ans.swapAt(i, j) }
            if ans[i] % 2 == 0 { i += 1 }
            if ans[j] % 2 == 1 { j -= 1 }
        }

        return ans
    }

}