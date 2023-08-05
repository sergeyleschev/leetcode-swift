class Solution {

    // Solution by Sergey Leschev
    // 2784. Check if Array is Good

    // Time complexity: O(n)
    // Space complexity: O(1)

    func isGood(_ nums: [Int]) -> Bool {
        var nums = nums
        let sz = nums.count

        var i = 0
        while i < sz {
            if nums[i] >= sz {
                return false
            }

            let pos = nums[i] - 1
            if nums[pos] == nums[i] {
                i += 1
            } else {
                nums.swapAt(pos, i)
            }
        }

        for i in 0..<sz {
            if nums[i] != i + 1 && i != sz - 1 {
                return false
            }
        }

        return sz >= 2 && nums.last == sz - 1 && nums[sz - 2] == sz - 1
    }
}
