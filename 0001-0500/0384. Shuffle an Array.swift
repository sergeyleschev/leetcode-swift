class Solution {

    // Solution by Sergey Leschev

    // 384. Shuffle an Array
    // Given an integer array nums, design an algorithm to randomly shuffle the array.
    // Implement the Solution class:
    // Solution(int[] nums) Initializes the object with the integer array nums.
    // int[] reset() Resets the array to its original configuration and returns it.
    // int[] shuffle() Returns a random shuffling of the array.

    // Example 1:
    // Input
    // ["Solution", "shuffle", "reset", "shuffle"]
    // [[[1, 2, 3]], [], [], []]
    // Output
    // [null, [3, 1, 2], [1, 2, 3], [1, 3, 2]]
    // Explanation
    // Solution solution = new Solution([1, 2, 3]);
    // solution.shuffle();    // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must be equally likely to be returned. Example: return [3, 1, 2]
    // solution.reset();      // Resets the array back to its original configuration [1,2,3]. Return [1, 2, 3]
    // solution.shuffle();    // Returns the random shuffling of array [1,2,3]. Example: return [1, 3, 2]

    // Constraints:
    // 1 <= nums.length <= 200
    // -10^6 <= nums[i] <= 10^6
    // All the elements of nums are unique.
    // At most 5 * 10^4 calls will be made to reset and shuffle.

    private let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }

    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }

    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var shuffled = self.nums
        for i in 0..<shuffled.count {
            let random = Int.random(in: i..<shuffled.count)
            shuffled.swapAt(i, random)
        }
        return shuffled
    }

}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
