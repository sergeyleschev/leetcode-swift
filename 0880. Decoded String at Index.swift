class Solution {

    // 880. Decoded String at Index
    // An encoded string s is given.  To find and write the decoded string to a tape, the encoded string is read one character at a time and the following steps are taken:
    // If the character read is a letter, that letter is written onto the tape.
    // If the character read is a digit (say d), the entire current tape is repeatedly written d-1 more times in total.
    // Now for some encoded string s, and an index k, find and return the k-th letter (1 indexed) in the decoded string.

    // Finds the K-th letter in the decoded string.

    // - Parameters:
    //   - S: An encoded string.
    //   - K: An index.
    // - Returns: The K-th letter in the decoded string.

    // Example 1:
    // Input: s = "leet2code3", k = 10
    // Output: "o"
    // Explanation: 
    // The decoded string is "leetleetcodeleetleetcodeleetleetcode".
    // The 10th letter in the string is "o".

    // Example 2:
    // Input: s = "ha22", k = 5
    // Output: "h"
    // Explanation: 
    // The decoded string is "hahahaha".  The 5th letter is "h".

    // Example 3:
    // Input: s = "a2345678999999999999999", k = 1
    // Output: "a"
    // Explanation: 
    // The decoded string is "a" repeated 8301530446056247680 times.  The 1st letter is "a".

    // Constraints:
    // 2 <= s.length <= 100
    // s will only contain lowercase letters and digits 2 through 9.
    // s starts with a letter.
    // 1 <= k <= 10^9
    // It's guaranteed that k is less than or equal to the length of the decoded string.
    // The decoded string is guaranteed to have less than 2^63 letters.

    // - Complexity:
    //   - time: O(n), where n is the length of an encoded string.
    //   - space: O(1), only constant space is used.
    
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        var size = 0
        let n = S.count
        var k = K
        
        for ch in S {
            if ch.isLetter {
                size += 1
            } else if let num = Int(String(ch)) {
                size *= num
            }
        }
        
        for ch in S.reversed() {
            k %= size            
            if k == 0, ch.isLetter { return String(ch) }
            
            if ch.isLetter {
                size -= 1
            } else if let num = Int(String(ch)) {
                size /= num
            }
        }
        
        fatalError("Invalid input string")
    }

}