class Solution {

    // Solution by Sergey Leschev
    // 2855. Minimum Right Shifts to Sort the Array
    // Time complexity: O(n log n)

    func minimumRightShifts(_ nums: [Int]) -> Int {
        var numsCopy = nums
        var ind = -1
        var temp = numsCopy
        temp.sort()

        func helper(_ nums: inout [Int], _ l: Int, _ h: Int) {
            var l = l
            var h = h
            while l < h {
                nums.swapAt(l, h)
                l += 1
                h -= 1
            }
        }

        helper(&numsCopy, 0, numsCopy.count - 1)

        for i in 1..<numsCopy.count {
            if numsCopy[i] > numsCopy[i - 1] {
                ind = i - 1
                break
            }
        }

        helper(&numsCopy, 0, ind)
        helper(&numsCopy, ind + 1, numsCopy.count - 1)

        if temp != numsCopy {
            return -1
        }
        return ind + 1
    }
}
