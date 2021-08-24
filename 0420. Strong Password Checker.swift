class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 420. Strong Password Checker
    // A password is considered strong if the below conditions are all met:
    // It has at least 6 characters and at most 20 characters.
    // It contains at least one lowercase letter, at least one uppercase letter, and at least one digit.
    // It does not contain three repeating characters in a row (i.e., "...aaa..." is weak, but "...aa...a..." is strong, assuming other conditions are met).
    // Given a string password, return the minimum number of steps required to make password strong. if password is already strong, return 0.
    // In one step, you can:
    // Insert one character to password,
    // Delete one character from password, or
    // Replace one character of password with another character.

    // Example 1:
    // Input: password = "a"
    // Output: 5

    // Example 2:
    // Input: password = "aA1"
    // Output: 3

    // Example 3:
    // Input: password = "1337C0d3"
    // Output: 0

    // Constraints:
    // 1 <= password.length <= 50
    // password consists of letters, digits, dot '.' or exclamation mark '!'.

    func strongPasswordChecker(_ password: String) -> Int {
        let arr = Array(password), c = arr.count
        var low = false, up = false, num = false
        arr.forEach({
            if $0.isLowercase { low = true }
            else if $0.isUppercase { up = true }
            else if $0.isNumber { num = true }
        })
        
        var types = 3
        if low { types -= 1 }
        if up { types -= 1 }
        if num { types -= 1 }
        
        var one = 0, two = 0, rep = 0, i = 2
        while i < c {
            if arr[i] == arr[i-1] && arr[i] == arr[i-2] {
                var l = 2
                while i < c && arr[i] == arr[i-1] {
                    l += 1
                    i += 1
                }
                rep += l / 3
                if l % 3 == 0 { one += 1 }
                else if l % 3 == 1 { two += 1 }
            } else {
                i += 1
            }
        }
        
        if c < 6 {
            return max(types, 6 - c)
        } else if c <= 20 {
            return max(types, rep)
        }

        let del = c - 20
        rep -= min(del, one)
        rep -= (min(max(del - one, 0), two * 2) / 2)
        rep -= (max(del - one - 2 * two, 0) / 3)

        return max(types, rep) + del
    }

}