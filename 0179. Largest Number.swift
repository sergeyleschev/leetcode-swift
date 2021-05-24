class Solution {

    // 179. Largest Number
    // Given a list of non-negative integers nums, arrange them such that they form the largest number.
    // Note: The result may be very large, so you need to return a string instead of an integer.

    // Arranges the list of non-negative integers to make the largest number.

    // - Parameter nums: The list of non-negative integers.
    // - Returns: The largest number.

    // Example 1:
    // Input: nums = [10,2]
    // Output: "210"

    // Example 2:
    // Input: nums = [3,30,34,5,9]
    // Output: "9534330"

    // Example 3:
    // Input: nums = [1]
    // Output: "1"

    // Example 4:
    // Input: nums = [10]
    // Output: "10"

    // Constraints:
    // 1 <= nums.length <= 100
    // 0 <= nums[i] <= 10^9

    // - Complexity:
    //   - time: O(n log(n)), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.

    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else { return "" }
        var ans = ""

        var strs = [String]()
        for num in nums { strs.append(String(num)) }

        strs.sort(by: { "\($0)\($1)" > "\($1)\($0)" })

        guard let first = strs.first, first != "0" else { return "0" }

        for str in strs { ans = "\(ans)\(str)" }

        return ans
    }

}