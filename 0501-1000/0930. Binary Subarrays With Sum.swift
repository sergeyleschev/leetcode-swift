class Solution {

    // Solution @ Sergey Leschev

    // 930. Binary Subarrays With Sum
    // Given a binary array nums and an integer goal, return the number of non-empty subarrays with a sum goal.
    // A subarray is a contiguous part of the array.

    // Example 1:
    // Input: nums = [1,0,1,0,1], goal = 2
    // Output: 4
    // Explanation: The 4 subarrays are bolded and underlined below:
    // [1,0,1,0,1]
    // [1,0,1,0,1]
    // [1,0,1,0,1]
    // [1,0,1,0,1]

    // Example 2:
    // Input: nums = [0,0,0,0,0], goal = 0
    // Output: 15

    // Constraints:
    // 1 <= nums.length <= 3 * 10^4
    // nums[i] is either 0 or 1.
    // 0 <= goal <= nums.length

    func numSubarraysWithSum(_ A: [Int], _ S: Int) -> Int {
        var res = 0
        var ind = [-1]

        for i in 0..<A.count where A[i] == 1 { ind.append(i) }
        ind.append(A.count)

        if S == 0 {
            var res = 0
            for i in 0..<(ind.count - 1) {
                let count = ind[i + 1] - ind[i] - 1
                res += (count + 1) * count / 2
            }
            return res
        }

        for i in 0..<(ind.count - S - 1) {
            let r = i + S
            res += (ind[i + 1] - ind[i]) * (ind[r + 1] - ind[r])
        }
        
        return res
    }

}