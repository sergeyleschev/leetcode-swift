class Solution {

    // 415. Add Strings
    // Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.
    // You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

    // Example 1:
    // Input: num1 = "11", num2 = "123"
    // Output: "134"

    // Example 2:
    // Input: num1 = "456", num2 = "77"
    // Output: "533"

    // Example 3:
    // Input: num1 = "0", num2 = "0"
    // Output: "0"

    // Constraints:
    // 1 <= num1.length, num2.length <= 10^4
    // num1 and num2 consist of only digits.
    // num1 and num2 don't have any leading zeros except for the zero itself.

    func addStrings(_ num1: String, _ num2: String) -> String {
        var index1 = num1.index(before: num1.endIndex)
        var index2 = num2.index(before: num2.endIndex)
        var result = ""
        var digit = 0
        
        while index1 != num1.endIndex || index2 != num2.endIndex{
            var temp = 0
            if index1 != num1.endIndex {
                temp += Int(String(num1[index1]))!
                index1 = index1 == num1.startIndex ? num1.endIndex : num1.index(before: index1)
            }
            if index2 != num2.endIndex {
                temp += Int(String(num2[index2]))!
                index2 = index2 == num2.startIndex ? num2.endIndex : num2.index(before: index2)
            }
            temp += digit
            if temp >= 10 {
                temp -= 10
                digit = 1
            }else {
                digit = 0
            }
            result = "\(temp)" + result
        }
        
        result = digit == 1 ? "1" + result : result
        return result
    }

}