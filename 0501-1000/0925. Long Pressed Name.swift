class Solution {

    // Solution by Sergey Leschev

    // 925. Long Pressed Name
    // Your friend is typing his name into a keyboard. Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.
    // You examine the typed characters of the keyboard. Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.

    // Example 1:
    // Input: name = "alex", typed = "aaleex"
    // Output: true
    // Explanation: 'a' and 'e' in 'alex' were long pressed.

    // Example 2:
    // Input: name = "saeed", typed = "ssaaedd"
    // Output: false
    // Explanation: 'e' must have been pressed twice, but it wasn't in the typed output.

    // Example 3:
    // Input: name = "leelee", typed = "lleeelee"
    // Output: true

    // Example 4:
    // Input: name = "laiden", typed = "laiden"
    // Output: true
    // Explanation: It's not necessary to long press any character.

    // Constraints:
    // 1 <= name.length <= 1000
    // 1 <= typed.length <= 1000
    // name and typed contain only lowercase English letters.

    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var i = 0
        var j = 0

        while i < name.count && j < typed.count {
            if name[name.index(name.startIndex, offsetBy: i)]
                == typed[typed.index(typed.startIndex, offsetBy: j)]
            {
                i += 1
                j += 1
            } else if i > 0
                && name[name.index(name.startIndex, offsetBy: i - 1)]
                    == typed[typed.index(typed.startIndex, offsetBy: j)]
            {
                j += 1
            } else {
                return false
            }
        }

        if i != name.count { return false }
        if j == typed.count { return true }
        for c in typed[typed.index(typed.startIndex, offsetBy: j)...] where c != name.last {
            return false
        }
        return true
    }

}
