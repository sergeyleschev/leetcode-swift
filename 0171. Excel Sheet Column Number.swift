class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 171. Excel Sheet Column Number
    // Given a string columnTitle that represents the column title as appear in an Excel sheet, return its corresponding column number.
    // For example:
    // A -> 1
    // B -> 2
    // C -> 3
    // ...
    // Z -> 26
    // AA -> 27
    // AB -> 28 
    // ...

    // Finds the corresponding column number for a column title.

    // - Parameter s: The column title.
    // - Returns: The column title corresponding column number.

    // Example 1:
    // Input: columnTitle = "A"
    // Output: 1

    // Example 2:
    // Input: columnTitle = "AB"
    // Output: 28

    // Example 3:
    // Input: columnTitle = "ZY"
    // Output: 701

    // Example 4:
    // Input: columnTitle = "FXSHRXW"
    // Output: 2147483647

    // Constraints:
    // 1 <= columnTitle.length <= 7
    // columnTitle consists only of uppercase English letters.
    // columnTitle is in the range ["A", "FXSHRXW"].

    // - Complexity:
    //   - time: O(n), where n is the length of the column title.
    //   - space: O(1), only constant space is used.
    
    func titleToNumber(_ s: String) -> Int {
        var res = 0
        
        for i in s.utf8 {
            res = res * 26 + (Int(i) - 64)
        }
        
        return res
    }

}