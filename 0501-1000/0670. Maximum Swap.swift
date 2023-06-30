class Solution {

    // Solution by Sergey Leschev

    // 670. Maximum Swap
    // You are given an integer num. You can swap two digits at most once to get the maximum valued number.
    // Return the maximum valued number you can get.

    // Example 1:
    // Input: num = 2736
    // Output: 7236
    // Explanation: Swap the number 2 and the number 7.

    // Example 2:
    // Input: num = 9973
    // Output: 9973
    // Explanation: No swap.

    // Constraints:
    // 0 <= num <= 10^8

    func maximumSwap(_ num: Int) -> Int {
        var nums = "\(num)".map{ String($0) }
        let sortNums = nums.sorted{ $0 > $1 }
        
        for (i, (num1, num2)) in zip(nums, sortNums).enumerated() where num1 != num2 {
            var index = 0
            for j in (i + 1..<nums.count).reversed() where nums[j] == num2 { index = j; break }
            nums[index] = num1
            nums[i] = num2
            break
        }
        
        return Int(nums.joined()) ?? 0
    }

}