class Solution {

    // Solution by Sergey Leschev

    // 168. Excel Sheet Column Title
    // Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.
    // For example:
    // A -> 1
    // B -> 2
    // C -> 3
    // ...
    // Z -> 26
    // AA -> 27
    // AB -> 28
    // ...

    // Example 1:
    // Input: columnNumber = 1
    // Output: "A"

    // Example 2:
    // Input: columnNumber = 28
    // Output: "AB"

    // Example 3:
    // Input: columnNumber = 701
    // Output: "ZY"

    // Example 4:
    // Input: columnNumber = 2147483647
    // Output: "FXSHRXW"

    // Constraints:
    // 1 <= columnNumber <= 2^31 - 1

    func convertToTitle(_ columnNumber: Int) -> String {
        var string = ""
        var num = columnNumber - 1
        var rem = 0
        var nums: [Int] = []

        while num >= 0 {
            rem = num % 26
            num = num / 26
            nums.append(rem)
            if num == 0 { break }
        }

        nums[0] += 1
        if nums.count > 1 && nums[nums.count - 1] == 1 && nums[nums.count - 2] == 0 {
            nums.remove(at: nums.count - 1)
        }

        for num in nums {
            let c = num == 0 ? 26 : num
            string = "\(Character(Unicode.Scalar(c + 64)!))\(string)"
        }

        return string
    }

}
