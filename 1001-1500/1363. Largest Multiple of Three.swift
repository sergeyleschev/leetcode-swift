class Solution {

    // Solution by Sergey Leschev

    // 1363. Largest Multiple of Three
    // Given an integer array of digits, return the largest multiple of three that can be formed by concatenating some of the given digits in any order.
    // Since the answer may not fit in an integer data type, return the answer as a string.
    // If there is no answer return an empty string.

    // Example 1:
    // Input: digits = [8,1,9]
    // Output: "981"

    // Example 2:
    // Input: digits = [8,6,7,1,0]
    // Output: "8760"

    // Example 3:
    // Input: digits = [1]
    // Output: ""

    // Example 4:
    // Input: digits = [0,0,0,0,0,0]
    // Output: "0"

    // Constraints:
    // 1 <= digits.length <= 10^4
    // 0 <= digits[i] <= 9
    // The returning answer must not contain unnecessary leading zeros.

    func largestMultipleOfThree(_ digits: [Int]) -> String {
        var ans = ""
        var counter = [Int](repeating: 0, count: 10)
        var sum = 0
        var temp = 9


        func del(_ n: Int) -> Bool {
            for i in 0...9 where i % 3 == n && counter[i] > 0 { counter[i] -= 1; return true }
            return false
        }

        for digit in digits {
            counter[digit] += 1
            sum += digit
        }
        
        if sum % 3 == 1 {
            if !del(1) { del(2); del(2) }
        } else if sum % 3 == 2 {
            if !del(2) { del(1); del(1) }
        }

        while temp >= 0 {
            if counter[temp] > 0 { ans += String(repeating: "\(temp)", count: counter[temp]) }
            temp -= 1
        }
        guard !ans.isEmpty else { return "" }
        guard !ans.hasPrefix("0") else { return "0" }
        return ans
    }

 }