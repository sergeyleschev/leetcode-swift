class Solution {

    // Solution @ Sergey Leschev

    // 434. Number of Segments in a String
    // You are given a string s, return the number of segments in the string. 
    // A segment is defined to be a contiguous sequence of non-space characters.

    // Example 1:
    // Input: s = "Hello, my name is John"
    // Output: 5
    // Explanation: The five segments are ["Hello,", "my", "name", "is", "John"]

    // Example 2:
    // Input: s = "Hello"
    // Output: 1

    // Example 3:
    // Input: s = "love live! mu'sic forever"
    // Output: 4

    // Example 4:
    // Input: s = ""
    // Output: 0

    // Constraints:
    // 0 <= s.length <= 300
    // s consists of lower-case and upper-case English letters, digits or one of the following characters "!@#$%^&*()_+-=',.:".
    // The only space character in s is ' '.

    func countSegments(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        var isContinuous = false
        var result = 0
        
        for i in s {
            if i == " " {
                result = isContinuous ? result + 1 : result
                isContinuous = false
            }else {
                isContinuous = true
            }
        }
        
        return isContinuous ? result + 1 : result
    }

}