class Solution {

    // Solution by Sergey Leschev

    // 350. Intersection of Two Arrays II
    // Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

    // Computes intersections of two arrays.

    // - Parameters:
    //   - nums1: An array.
    //   - nums2: An array.
    // - Returns: Intersection of two arrays.

    // Example 1:
    // Input: nums1 = [1,2,2,1], nums2 = [2,2]
    // Output: [2,2]

    // Example 2:
    // Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    // Output: [4,9]
    // Explanation: [9,4] is also accepted. 

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 1000
    // 0 <= nums1[i], nums2[i] <= 1000
     
    // Follow up:
    // What if the given array is already sorted? How would you optimize your algorithm?
    // What if nums1's size is small compared to nums2's size? Which algorithm is better?
    // What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

    // - Complexity:
    //   - time: O(max(n, m)), where n is length of nums1, and m is the length of nums2.
    //   - space: O(n), where n is length of nums1.

    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic = [Int: Int]()
        var ans = [Int]()
        
        for num in nums1 { dic[num, default: 0] += 1 }
                
        for num in nums2 {
            guard let val = dic[num], val > 0 else { continue }
            ans.append(num)
            dic[num] = val - 1
        }
        
        return ans
    }
    
}