class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 777. Swap Adjacent in LR String
    // In a string composed of 'L', 'R', and 'X' characters, like "RXXLRXRXL", a move consists of either replacing one occurrence of "XL" with "LX", or replacing one occurrence of "RX" with "XR". Given the starting string start and the ending string end, return True if and only if there exists a sequence of moves to transform one string to the other.

    // Example 1:
    // Input: start = "RXXLRXRXL", end = "XRLXXRRLX"
    // Output: true
    // Explanation: We can transform start to end following these steps:
    // RXXLRXRXL ->
    // XRXLRXRXL ->
    // XRLXRXRXL ->
    // XRLXXRRXL ->
    // XRLXXRRLX

    // Example 2:
    // Input: start = "X", end = "L"
    // Output: false

    // Example 3:
    // Input: start = "LLR", end = "RRL"
    // Output: false

    // Example 4:
    // Input: start = "XL", end = "LX"
    // Output: true

    // Example 5:
    // Input: start = "XLLR", end = "LXLX"
    // Output: false

    // Constraints:
    // 1 <= start.length <= 10^4
    // start.length == end.length
    // Both start and end will only consist of characters in 'L', 'R', and 'X'.

    func canTransform(_ start: String, _ end: String) -> Bool {
        if start.replacingOccurrences(of: "X", with: "") != end.replacingOccurrences(of: "X", with: "") { return false }
        var i = 0
        var j = 0
        let count = start.count
        let start = Array(start)
        let end = Array(end)
        
        while i < count && j < count  {
            while i < count && start[i] == "X" { i += 1 }
            while j < count && end[j] == "X" { j += 1 }
            if i < count && start[i] == "L" && i < j { return false }
            if j < count && end[j] == "R" && i > j { return false }
            i += 1
            j += 1
        }
        
        return true
    }

}