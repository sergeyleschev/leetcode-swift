class Solution {

    // Solution by Sergey Leschev

    // 679. 24 Game
    // You are given an integer array cards of length 4. You have four cards, each containing a number in the range [1, 9]. You should arrange the numbers on these cards in a mathematical expression using the operators ['+', '-', '*', '/'] and the parentheses '(' and ')' to get the value 24.
    // You are restricted with the following rules:
    // The division operator '/' represents real division, not integer division.
    // For example, 4 / (1 - 2 / 3) = 4 / (1 / 3) = 12.
    // Every operation done is between two numbers. In particular, we cannot use '-' as a unary operator.
    // For example, if cards = [1, 1, 1, 1], the expression "-1 - 1 - 1 - 1" is not allowed.
    // You cannot concatenate numbers together
    // For example, if cards = [1, 2, 1, 2], the expression "12 + 12" is not valid.
    // Return true if you can get such expression that evaluates to 24, and false otherwise.

    // Example 1:
    // Input: cards = [4,1,8,7]
    // Output: true
    // Explanation: (8-4) * (7-1) = 24

    // Example 2:
    // Input: cards = [1,2,1,2]
    // Output: false

    // Constraints:
    // cards.length == 4
    // 1 <= cards[i] <= 9

    func judgePoint24(_ nums: [Int]) -> Bool {

        func judgePoint24(_ nums: [Double]) -> Bool {
            if nums.count == 1 { return abs(24 - nums[0]) <= 1e-9 }
            var found = false
            for i in 0..<nums.count - 1 {
                for j in i + 1..<nums.count {
                    let (a, b) = (nums[i], nums[j])
                    let nums = nums[..<i] + nums[(i + 1)..<j] + nums[(j + 1)...]
                    found = found || judgePoint24(nums + [a + b])
                    found = found || judgePoint24(nums + [a - b])
                    found = found || judgePoint24(nums + [b - a])
                    found = found || judgePoint24(nums + [a * b])
                    found = found || (b != 0 && judgePoint24(nums + [a / b]))
                    found = found || (a != 0 && judgePoint24(nums + [b / a]))
                    if found { return true }
                }
            }
            return false
        }

        return judgePoint24(nums.map { Double($0) })
    }

}
