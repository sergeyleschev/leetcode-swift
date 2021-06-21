class Solution {

    // 844. Backspace String Compare
    // Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.
    // Note that after backspacing an empty text, the text will continue empty.

    // Example 1:
    // Input: s = "ab#c", t = "ad#c"
    // Output: true
    // Explanation: Both s and t become "ac".

    // Example 2:
    // Input: s = "ab##", t = "c#d#"
    // Output: true
    // Explanation: Both s and t become "".

    // Example 3:
    // Input: s = "a##c", t = "#a#c"
    // Output: true
    // Explanation: Both s and t become "c".

    // Example 4:
    // Input: s = "a#c", t = "b"
    // Output: false
    // Explanation: s becomes "c" while t becomes "b".

    // Constraints:
    // 1 <= s.length, t.length <= 200
    // s and t only contain lowercase letters and '#' characters.

    // Follow up: Can you solve it in O(n) time and O(1) space?

    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var sArr = Array(S)
        var tArr = Array(T)

        func _backspace(s: String) -> [Character] {
            let chars = Array(s)
            var stack = [Character]()

            for char in chars {
                if char == "#" {
                    guard !stack.isEmpty else { continue }
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
            return stack
        }

        return _backspace(s: S) == _backspace(s: T)
    }
    
}