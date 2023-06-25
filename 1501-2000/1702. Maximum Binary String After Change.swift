class Solution {

    // Solution @ Sergey Leschev

    // 1702. Maximum Binary String After Change
    // You are given a binary string binary consisting of only 0's or 1's. You can apply each of the following operations any number of times:
    // Operation 1: If the number contains the substring "00", you can replace it with "10".
    // For example, "00010" -> "10010"
    // Operation 2: If the number contains the substring "10", you can replace it with "01".
    // For example, "00010" -> "00001"
    // Return the maximum binary string you can obtain after any number of operations. Binary string x is greater than binary string y if x's decimal representation is greater than y's decimal representation.

    // Example 1:
    // Input: binary = "000110"
    // Output: "111011"
    // Explanation: A valid transformation sequence can be:
    // "000110" -> "000101" 
    // "000101" -> "100101" 
    // "100101" -> "110101" 
    // "110101" -> "110011" 
    // "110011" -> "111011"

    // Example 2:
    // Input: binary = "01"
    // Output: "01"
    // Explanation: "01" cannot be transformed any further.

    // Constraints:
    // 1 <= binary.length <= 10^5
    // binary consist of '0' and '1'.

    func maximumBinaryString(_ binary: String) -> String {
        guard let firstIdx = binary.firstIndex(of: "0") else { return binary }
        var ans = ""
        if firstIdx != binary.startIndex { ans += String(binary[binary.startIndex..<firstIdx]) }
        var zeroCnt = 0
        var idx = firstIdx

        while idx < binary.endIndex {
            if binary[idx] == "0" { zeroCnt += 1 }
            idx = binary.index(after: idx)
        }
        let oneCnt = binary.distance(from: firstIdx, to: binary.endIndex) - zeroCnt
        if zeroCnt >  1 { ans += String(repeating: "1", count: zeroCnt - 1) }
        ans += "0"
        if oneCnt > 0 { ans.append(String(repeating: "1", count: oneCnt)) }
        return ans
    }
    
}