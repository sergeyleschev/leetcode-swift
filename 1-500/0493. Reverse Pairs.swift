class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 493. Reverse Pairs
    // Given an integer array nums, return the number of reverse pairs in the array.
    // A reverse pair is a pair (i, j) where 0 <= i < j < nums.length and nums[i] > 2 * nums[j].

    // Example 1:
    // Input: nums = [1,3,2,3,1]
    // Output: 2

    // Example 2:
    // Input: nums = [2,4,3,5,1]
    // Output: 3

    // Constraints:
    // 1 <= nums.length <= 5 * 10^4
    // -2^31 <= nums[i] <= 2^31 - 1

    func reversePairs(_ nums: [Int]) -> Int {
        if nums.count < 2 {return 0 }
        var count = 0
        var newNums = nums

        reversePairsSort(&newNums, 0, nums.count - 1, count: &count)
        return count
    }

    
    func reversePairsSort(_ nums:inout [Int], _ left:Int, _ right:Int, count:inout Int) -> Void {
        if left == right { return }
        let mid = left + (right - left)/2

        reversePairsSort(&nums, left, mid, count: &count)
        reversePairsSort(&nums, mid+1, right, count: &count)

        var i = left
        var j = mid + 1
        while i <= mid {
            while j <= right && nums[i] > nums[j] * 2 { j += 1 }
            count += j - mid - 1
            i += 1
        }

        var newNums = [Int]()
        var p1 = left
        var p2 = mid + 1
        while p1 <= mid || p2 <= right {
            if p1 > mid {
                newNums.append(nums[p2])
                p2 += 1
            } else if p2 > right {
                newNums.append(nums[p1])
                p1 += 1
            } else {
                if nums[p1] < nums[p2] {
                    newNums.append(nums[p1])
                    p1 += 1
                } else {
                    newNums.append(nums[p2])
                    p2 += 1
                }
            }
        }

        for k in 0..<newNums.count { nums[left + k] = newNums[k] }
    }
    
}