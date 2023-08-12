class Solution {

    // Solution by Sergey Leschev
    // 2811. Check if it is Possible to Split Array
    // O(n)

    func canSplitArray(_ nums: [Int], _ m: Int) -> Bool {
        if nums.count <= 2 {
            return true
        }

        for i in 1..<nums.count {
            if nums[i] + nums[i - 1] >= m {
                return true
            }
        }

        return false
    }
}
