class Solution {

    // 551. Student Attendance Record I
    // You are given a string s representing an attendance record for a student where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:
    // 'A': Absent.
    // 'L': Late.
    // 'P': Present.
    // The student is eligible for an attendance award if they meet both of the following criteria:
    // The student was absent ('A') for strictly fewer than 2 days total.
    // The student was never late ('L') for 3 or more consecutive days.
    // Return true if the student is eligible for an attendance award, or false otherwise.

    // Finds whether the student could be rewarded according to his attendance record.
    
    // - Parameter s: A string representing an attendance record for a student.
    // - Returns: True if the student could be rewarded, otherwise returns false.

    // Example 1:
    // Input: s = "PPALLP"
    // Output: true
    // Explanation: The student has fewer than 2 absences and was never late 3 or more consecutive days.

    // Example 2:
    // Input: s = "PPALLL"
    // Output: false
    // Explanation: The student was late 3 consecutive days in the last 3 days, so is not eligible for the award.

    // Constraints:
    // 1 <= s.length <= 1000
    // s[i] is either 'A', 'L', or 'P'.

    // - Complexity:
    //   - time: O(n), where n is the number of records in s.
    //   - space: O(1), only constant space is used.
    
    func checkRecord(_ s: String) -> Bool {
        var a = 0
        var l = 0

        for c in s {
            if c == "A" { a += 1 }
            if c == "L" { l += 1 } else { l = 0 }
            
            guard a < 2, l < 3 else { return false }
        }

        return true
    }

}