class Solution {

    // 344. Reverse String
    // Write a function that reverses a string. The input string is given as an array of characters s.

    // Reverses a string in-place.
    // - Parameter s: An array of characters.

    // Example 1:
    // Input: s = ["h","e","l","l","o"]
    // Output: ["o","l","l","e","h"]

    // Example 2:
    // Input: s = ["H","a","n","n","a","h"]
    // Output: ["h","a","n","n","a","H"]

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is a printable ascii character.
     
    // Follow up: Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

    // - Complexity:
    //   - time: O(n), where n is the length of the *s*.
    //   - space: O(1), only constant space is used.

    func reverseString(_ s: inout [Character]) {
        var i = 0
        var j = s.count-1

        while i < j {
            s.swapAt(i, j)

            i += 1
            j -= 1
        }
    }

}