class Solution {

    // 1567. Maximum Length of Subarray With Positive Product
    // Given an array of integers nums, find the maximum length of a subarray where the product of all its elements is positive.
    // A subarray of an array is a consecutive sequence of zero or more values taken out of that array.

    // Return the maximum length of a subarray with positive product.

    // Example 1:
    // Input: nums = [1,-2,-3,4]
    // Output: 4
    // Explanation: The array nums already has a positive product of 24.

    // Example 2:
    // Input: nums = [0,1,-2,-3,-4]
    // Output: 3
    // Explanation: The longest subarray with positive product is [1,-2,-3] which has a product of 6.
    // Notice that we cannot include 0 in the subarray since that'll make the product 0 which is not positive.

    // Example 3:
    // Input: nums = [-1,-2,-3,0,1]
    // Output: 2
    // Explanation: The longest subarray with positive product is [-1,-2] or [-2,-3].

    // Example 4:
    // Input: nums = [-1,2]
    // Output: 1

    // Example 5:
    // Input: nums = [1,2,3,5,-6,4,0,10]
    // Output: 4

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^9 <= nums[i] <= 10^9

    private enum Product { case positive, negative, null }


    func getMaxLen(_ nums: [Int]) -> Int {
        var ans = 0
        var tempArr = [Bool]()


        func getAns(_ arr: [Bool]){
            var negativeIndices = [Int]()
            for i in 0..<arr.count where !arr[i] { negativeIndices.append(i) }
            guard negativeIndices.count % 2 == 1 else { ans = max(ans, arr.count); return }
            let n = arr.count

            if let first = negativeIndices.first {
                let left = first > 0 ? first : 0
                let right = max(0, n - (first + 1))
                ans = max(ans, left,right)
            }
            if let last = negativeIndices.last {
                let right = last == n - 1 ? 0 : (n - (last + 1))
                let left = last
                ans = max(ans, left,right)
            }
        }

        for num in nums {
            if num == 0 {
                if !tempArr.isEmpty { getAns(tempArr) }
                tempArr = []
            } else { tempArr.append(num > 0) }
        }
        if !tempArr.isEmpty { getAns(tempArr) }
        return ans
    }

}