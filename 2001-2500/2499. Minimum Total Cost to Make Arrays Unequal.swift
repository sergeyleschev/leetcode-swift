class Solution {

    // Solution by Sergey Leschev
    // 2499. Minimum Total Cost to Make Arrays Unequal

    func minimumTotalCost(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        var ans = 0
        var freq = [Int: Int]()
        var maxFrequency = 0
        var maxFrequencyValue = 0
        var toSwap = 0
        
        for i in 0..<n {
            if nums1[i] == nums2[i] {
                freq[nums1[i], default: 0] += 1
                if freq[nums1[i]]! > maxFrequency {
                    maxFrequencyValue = nums1[i]
                }
                maxFrequency = max(maxFrequency, freq[nums1[i]]!)
                toSwap += 1
                ans += i
            }
        }
        
        for i in 0..<n {
            if maxFrequency > toSwap/2 && nums1[i] != nums2[i] && nums1[i] != maxFrequencyValue && nums2[i] != maxFrequencyValue {
                ans += i
                toSwap += 1
            }
        }
        
        if maxFrequency > toSwap/2 {
            return -1
        }
        
        return ans
    }
}
