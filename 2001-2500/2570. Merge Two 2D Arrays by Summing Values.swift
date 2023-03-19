class Solution {

    // Solution @ Sergey Leschev

    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var idToSum = [Int: Int]()
        
        // add values from nums1
        for num in nums1 {
            idToSum[num[0], default: 0] += num[1]
        }
        
        // add values from nums2
        for num in nums2 {
            idToSum[num[0], default: 0] += num[1]
        }
        
        // convert dictionary back to array
        var result = [[Int]]()
        for (id, sum) in idToSum.sorted(by: { $0.key < $1.key }) {
            result.append([id, sum])
        }
        
        return result
    }
}
