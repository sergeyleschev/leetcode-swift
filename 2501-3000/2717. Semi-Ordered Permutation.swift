class Solution {

    // Solution by Sergey Leschev
    // 2717. Semi-Ordered Permutation

    func semiOrderedPermutation(_ nums: [Int]) -> Int {
        var imin = 0
        var imax = nums.count
        var n = nums.count

        for i in 0..<n {
            if nums[i] == 1 {
                imin = i
            }
            if nums[i] == n {
                imax = i
            }
        }

        if imin < imax {
            return (imin + n - imax - 1)
        }

        return (imin + n - imax - 1) - 1
    }
}
