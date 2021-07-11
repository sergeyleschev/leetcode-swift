class Solution {

    // 1365. How Many Numbers Are Smaller Than the Current Number
    // Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
    // Return the answer in an array.

    // For each nums[i] finds out how many numbers in the array are smaller than it.
    
    // - Parameter nums: Array of numbers.
    // - Returns: Array where number on position *i* represent how many numbers are smaller than *nums[i]*.

    // Example 1:
    // Input: nums = [8,1,2,2,3]
    // Output: [4,0,1,1,3]
    // Explanation: 
    // For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3). 
    // For nums[1]=1 does not exist any smaller number than it.
    // For nums[2]=2 there exist one smaller number than it (1). 
    // For nums[3]=2 there exist one smaller number than it (1). 
    // For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).

    // Example 2:
    // Input: nums = [6,5,4,8]
    // Output: [2,1,0,3]

    // Example 3:
    // Input: nums = [7,7,7,7]
    // Output: [0,0,0,0]

    // Constraints:
    // 2 <= nums.length <= 500
    // 0 <= nums[i] <= 100

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.
    
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var rank = [Int](repeating: 0, count: 101)
        var ans = [Int](repeating: 0, count: nums.count)

        for num in nums { rank[num] += 1 }
        for i in 1..<rank.count { rank[i] += rank[i - 1] }

        for (i, num) in nums.enumerated() {
            if num == 0 {
                ans[i] = 0
            } else {
                ans[i] = rank[num - 1]
            }
        }

        return ans
    }

}