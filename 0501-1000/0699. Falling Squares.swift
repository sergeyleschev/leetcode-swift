class Solution {

    // Solution by Sergey Leschev

    // 699. Falling Squares
    // There are several squares being dropped onto the X-axis of a 2D plane.
    // You are given a 2D integer array positions where positions[i] = [lefti, sideLengthi] represents the ith square with a side length of sideLengthi that is dropped with its left edge aligned with X-coordinate lefti.
    // Each square is dropped one at a time from a height above any landed squares. It then falls downward (negative Y direction) until it either lands on the top side of another square or on the X-axis. A square brushing the left/right side of another square does not count as landing on it. Once it lands, it freezes in place and cannot be moved.
    // After each square is dropped, you must record the height of the current tallest stack of squares.
    // Return an integer array ans where ans[i] represents the height described above after dropping the ith square.

    // Example 1:
    // Input: positions = [[1,2],[2,3],[6,1]]
    // Output: [2,5,5]
    // Explanation:
    // After the first drop, the tallest stack is square 1 with a height of 2.
    // After the second drop, the tallest stack is squares 1 and 2 with a height of 5.
    // After the third drop, the tallest stack is still squares 1 and 2 with a height of 5.
    // Thus, we return an answer of [2, 5, 5].

    // Example 2:
    // Input: positions = [[100,100],[200,100]]
    // Output: [100,100]
    // Explanation:
    // After the first drop, the tallest stack is square 1 with a height of 100.
    // After the second drop, the tallest stack is either square 1 or square 2, both with heights of 100.
    // Thus, we return an answer of [100, 100].
    // Note that square 2 only brushes the right side of square 1, which does not count as landing on it.

    // Constraints:
    // 1 <= positions.length <= 1000
    // 1 <= lefti <= 10^8
    // 1 <= sideLengthi <= 10^6

    func fallingSquares(_ positions: [[Int]]) -> [Int] {
        // [leftMost x, curMaxHeight]
        var height = [0]
        var pos = [0]

        var maxHeight = 0
        var res = [Int]()

        for p in positions {
            let left = p[0]
            let side = p[1]

            let i = insert(left, pos, true)
            let j = insert(left+side, pos, false)
            var high = 0

            for k in (i - 1)..<j { high = max(high, height[k]) }
            high += side

            pos[i..<j] = [left, left + side]
            height[i..<j] = [high, height[j - 1]]

            maxHeight = max(maxHeight, high)
            res.append(maxHeight)
        }

        return res
    }


    // isLeft:
    // true if target exist, return left insert point
    // flase if target exist, return right insert point
    func insert(_ target: Int, _ nums: [Int], _ isLeft: Bool) -> Int {
        if nums.isEmpty { return 0 }
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target { left = mid + 1 } else { right = mid }
        }

        if nums[left] == target {
            return isLeft ? left + 1 : left
        } else if nums[left] < target {
            return left + 1
        } else {
            return left
        }
    }

}