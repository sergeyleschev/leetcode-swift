class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 848. Shifting Letters
    // We have a string s of lowercase letters, and an integer array shifts.
    // Call the shift of a letter, the next letter in the alphabet, (wrapping around so that 'z' becomes 'a'). 
    // For example, shift('a') = 'b', shift('t') = 'u', and shift('z') = 'a'.
    // Now for each shifts[i] = x, we want to shift the first i+1 letters of S, x times.
    // Return the final string after all such shifts to s are applied.

    // Example 1:
    // Input: s = "abc", shifts = [3,5,9]
    // Output: "rpl"
    // Explanation: 
    // We start with "abc".
    // After shifting the first 1 letters of S by 3, we have "dbc".
    // After shifting the first 2 letters of S by 5, we have "igc".
    // After shifting the first 3 letters of S by 9, we have "rpl", the answer.

    // Note:
    // 1 <= s.length = shifts.length <= 20000
    // 0 <= shifts[i] <= 10^9

    func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
        var arr = Array(S)	
        var sum = 0
        var newShifts = [Int]()

        for shift in shifts{
            newShifts.append(shift % 26)
            sum += newShifts.last!
        }

        for i in 0..<newShifts.count{
            let asciiVal = (Int(arr[i].asciiValue!) - 97 + sum) % 26 + 97
            let char = Character(UnicodeScalar(asciiVal)!)
            arr[i] = char
            sum -= newShifts[i]
        }

        return String(arr)
    }

}