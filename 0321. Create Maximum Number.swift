class Solution {

    // 321. Create Maximum Number
    // You are given two integer arrays nums1 and nums2 of lengths m and n respectively. nums1 and nums2 represent the digits of two numbers. You are also given an integer k.
    // Create the maximum number of length k <= m + n from digits of the two numbers. The relative order of the digits from the same array must be preserved.
    // Return an array of the k digits representing the answer.

    // Example 1:
    // Input: nums1 = [3,4,6,5], nums2 = [9,1,2,5,8,3], k = 5
    // Output: [9,8,6,5,3]

    // Example 2:
    // Input: nums1 = [6,7], nums2 = [6,0,4], k = 5
    // Output: [6,7,6,0,4]

    // Example 3:
    // Input: nums1 = [3,9], nums2 = [8,9], k = 3
    // Output: [9,8,9]

    // Constraints:
    // m == nums1.length
    // n == nums2.length
    // 1 <= m, n <= 500
    // 0 <= nums1[i], nums2[i] <= 9
    // 1 <= k <= m + n
 
    // Follow up: Try to optimize your time and space complexity.
    
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        let start = max(0, k - nums2.count)
        let end = min(k, nums1.count)
        var res = [Int]()

        for i in start...end {
            let stack1 = maxStack(nums: nums1, k: i)
            let stack2 = maxStack(nums: nums2, k: k - i)
            res = compareIntArray(item1: res, item2: mergetStack(stack1: stack1, stack2: stack2))
        }
        
        return res
    }


    func compareIntArray(item1: [Int], item2: [Int]) -> [Int] {
        var i = 0
        var j = 0

        while i < item1.count && j < item2.count {
            if item1[i] < item2[j] {
                return item2
            } else if item1[i] > item2[j] {
                return item1
            }
            i += 1
            j += 1
        }
        
        if i == item1.count { return item2 }
        return item1
    }


    func mergetStack(stack1: [Int], stack2: [Int]) -> [Int] {
        var res = [Int]()
        var i = 0
        var j = 0
        
        let compare = { (index1: Int, index2: Int) -> Bool in
            var index1 = index1
            var index2 = index2

            while index1 < stack1.count && index2 < stack2.count {
                if stack1[index1] < stack2[index2] {
                    return false
                } else if stack1[index1] > stack2[index2] {
                    return true
                }
                index1 += 1
                index2 += 1
            }
            return index1 != stack1.count
        }
        
        while i < stack1.count && j < stack2.count {
            if compare(i, j) { res.append(stack1[i]); i += 1 } 
            else { res.append(stack2[j]); j += 1 }
        }

        while i < stack1.count { res.append(stack1[i]); i += 1 }
        while j < stack2.count { res.append(stack2[j]); j += 1 }
        return res
    }


    func maxStack(nums: [Int], k: Int) -> [Int] {
        var res = Array(repeating: 0, count: k)
        var top = -1
        var remain = nums.count - k

        for i in 0..<nums.count {
            while top >= 0 && res[top] < nums[i] && remain > 0 {
                top -= 1
                remain -= 1
            }
            if top < k - 1 {
                top += 1
                res[top] = nums[i]
            } else {
                remain -= 1
            }
        }

        return res
    }

}