class NumArray {

    // Solution by Sergey Leschev

    // 303. Range Sum Query - Immutable
    // Given an integer array nums, handle multiple queries of the following type:
    // Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
    // Implement the NumArray class:
    // NumArray(int[] nums) Initializes the object with the integer array nums.
    // int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

    // Example 1:
    // Input
    // ["NumArray", "sumRange", "sumRange", "sumRange"]
    // [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
    // Output
    // [null, 1, -1, -3]
    // Explanation
    // NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
    // numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
    // numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
    // numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^5 <= nums[i] <= 10^5
    // 0 <= left <= right < nums.length
    // At most 10^4 calls will be made to sumRange.

    private var sums: [Int] = []

    init(_ nums: [Int]) {
        var sum: Int = 0
        for n in nums {
            sum += n
            sums.append(sum)
        }
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        let vi = i == 0 ? sums[i] : sums[i] - sums[i - 1]
        let ans = sums[j] - sums[i] + vi

        return ans
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
