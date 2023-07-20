class Solution {

    // Solution by Sergey Leschev
    // 2763. Sum of Imbalance Numbers of All Subarrays
    // Complexity
    // Time: O(n^2)
    // Space: O(n)

    func sumImbalanceNumbers(_ nums: [Int]) -> Int {
        var res = 0
        let n = nums.count
        
        for i in 0..<n {
            var s = Set<Int>()
            s.insert(nums[i])
            var cur = 0
            
            for j in (i + 1)..<n {
                if !s.contains(nums[j]) {
                    var d = 1
                    if s.contains(nums[j] - 1) { d -= 1 }
                    if s.contains(nums[j] + 1) { d -= 1 }
                    cur += d
                    s.insert(nums[j])
                }
                res += cur
            }
        }
        
        return res
    }
}
