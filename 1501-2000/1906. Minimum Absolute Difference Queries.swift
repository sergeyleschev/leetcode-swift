class Solution {

    // Solution by Sergey Leschev

    // 1906. Minimum Absolute Difference Queries
    // The minimum absolute difference of an array a is defined as the minimum value of |a[i] - a[j]|, where 0 <= i < j < a.length and a[i] != a[j]. If all elements of a are the same, the minimum absolute difference is -1.
    // For example, the minimum absolute difference of the array [5,2,3,7,2] is |2 - 3| = 1. Note that it is not 0 because a[i] and a[j] must be different.
    // You are given an integer array nums and the array queries where queries[i] = [li, ri]. For each query i, compute the minimum absolute difference of the subarray nums[li...ri] containing the elements of nums between the 0-based indices li and ri (inclusive).
    // Return an array ans where ans[i] is the answer to the ith query.
    // A subarray is a contiguous sequence of elements in an array.
    // The value of |x| is defined as:
    // x if x >= 0.
    // -x if x < 0.

    // Example 1:
    // Input: nums = [1,3,4,8], queries = [[0,1],[1,2],[2,3],[0,3]]
    // Output: [2,1,4,1]
    // Explanation: The queries are processed as follows:
    // - queries[0] = [0,1]: The subarray is [1,3] and the minimum absolute difference is |1-3| = 2.
    // - queries[1] = [1,2]: The subarray is [3,4] and the minimum absolute difference is |3-4| = 1.
    // - queries[2] = [2,3]: The subarray is [4,8] and the minimum absolute difference is |4-8| = 4.
    // - queries[3] = [0,3]: The subarray is [1,3,4,8] and the minimum absolute difference is |3-4| = 1.

    // Example 2:
    // Input: nums = [4,5,2,2,7,10], queries = [[2,3],[0,2],[0,5],[3,5]]
    // Output: [-1,1,1,3]
    // Explanation: The queries are processed as follows:
    // - queries[0] = [2,3]: The subarray is [2,2] and the minimum absolute difference is -1 because all the
    //   elements are the same.
    // - queries[1] = [0,2]: The subarray is [4,5,2] and the minimum absolute difference is |4-5| = 1.
    // - queries[2] = [0,5]: The subarray is [4,5,2,2,7,10] and the minimum absolute difference is |4-5| = 1.
    // - queries[3] = [3,5]: The subarray is [2,7,10] and the minimum absolute difference is |7-10| = 3.

    // Constraints:
    // 2 <= nums.length <= 10^5
    // 1 <= nums[i] <= 100
    // 1 <= queries.length <= 2 * 10^4
    // 0 <= li < ri < nums.length

    func minDifference(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        var prefix = [[Int]]()
        var curCounter = [Int](repeating: 0, count: 101)
        prefix.append(curCounter)

        for num in nums {
            curCounter[num] += 1
            prefix.append(curCounter)
        }

        for query in queries {
            let leftCounter = prefix[query[0]]
            let rightCounter = prefix[query[1] + 1]
            var temp = Int.max
            var last = -1
            for idx in 0...100 where rightCounter[idx] - leftCounter[idx] > 0 {
                if last != -1 { temp = min(temp, idx - last) }
                last = idx
            }
            ans.append(temp == Int.max ? -1 : temp)
        }
        return ans
    }

}
