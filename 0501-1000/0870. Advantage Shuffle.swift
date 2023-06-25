class Solution {

    // Solution @ Sergey Leschev

    // 870. Advantage Shuffle
    // Given two arrays nums1 and nums2 of equal size, the advantage of nums1 with respect to nums2 is the number of indices i for which nums1[i] > nums2[i].
    // Return any permutation of nums1 that maximizes its advantage with respect to nums2.

    // Finds any permutation of A that maximizes its advantage with respect to B.

    // - Parameters:
    //   - A: An array.
    //   - B: An array.
    // - Returns: Advantage shuffle.

    // Example 1:
    // Input: nums1 = [2,7,11,15], nums2 = [1,10,4,11]
    // Output: [2,11,7,15]

    // Example 2:
    // Input: nums1 = [12,24,8,32], nums2 = [13,25,32,11]
    // Output: [24,32,8,12]

    // Note:
    // 1 <= nums1.length = nums2.length <= 10000
    // 0 <= nums1[i] <= 10^9
    // 0 <= nums2[i] <= 10^9

    // - Complexity:
    //   - time: O(n log n), where n is the length of A and B.
    //   - space: O(n), where n is the length of A and B.
    
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        let sortedA = A.sorted()
        let sortedB = B.sorted()
        var assigned = [Int: [Int]]()
        for b in B { assigned[b] = [Int]() }
        let n = B.count        
        var ans = [Int](repeating: 0, count: n)
        var remaining = [Int]()
        var j = 0
        
        for a in sortedA {
            if a > sortedB[j] {
                assigned[sortedB[j]]?.append(a)
                j += 1
            } else { remaining.append(a) }
        }
        
        
        for i in 0..<n {
            if assigned[B[i]]?.isEmpty ?? true {
                ans[i] = remaining.removeLast()
            } else {
                ans[i] = assigned[B[i]]?.removeLast() ?? -1
            }
        }
        
        return ans
    }

}