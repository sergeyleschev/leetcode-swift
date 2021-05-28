class Solution {

    // 368. Largest Divisible Subset
    // Given a set of distinct positive integers nums, return the largest subset answer such that every pair (answer[i], answer[j]) of elements in this subset satisfies:
    // answer[i] % answer[j] == 0, or
    // answer[j] % answer[i] == 0
    // If there are multiple solutions, return any of them.

    // Example 1:
    // Input: nums = [1,2,3]
    // Output: [1,2]
    // Explanation: [1,3] is also accepted.

    // Example 2:
    // Input: nums = [1,2,4,8]
    // Output: [1,2,4,8]

    // Constraints:
    // 1 <= nums.length <= 1000
    // 1 <= nums[i] <= 2 * 10^9
    // All the integers in nums are unique.

    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        if nums.isEmpty || nums.count == 1 { return nums }
        
        let sorted = nums.sorted()
        var largestDivisibleSubsetSize = 0
        let numsCount = sorted.count
        var divisorsCount = Array(repeating: 1, count: numsCount)
        var previous = Array(repeating: -1, count: numsCount)
        var subset = [Int]()
        
        for i in 1..<numsCount {
            for j in 0..<i {
                if sorted[i] % sorted[j] == 0 && divisorsCount[i] < divisorsCount[j] + 1 {
                    divisorsCount[i] = divisorsCount[j] + 1
                    previous[i] = j
                }
            }
            
            if divisorsCount[largestDivisibleSubsetSize] < divisorsCount[i] {
                largestDivisibleSubsetSize = i
            }
        }
        

        var k = largestDivisibleSubsetSize
        while k >= 0 {
            subset.append(sorted[k])
            k = previous[k]
        }
        
        return subset.reversed()
    }

}