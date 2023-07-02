class Solution {

    // Solution by Sergey Leschev

    // 1750. Minimum Length of String After Deleting Similar Ends
    // Given a string s consisting only of characters 'a', 'b', and 'c'. You are asked to apply the following algorithm on the string any number of times:
    // Pick a non-empty prefix from the string s where all the characters in the prefix are equal.
    // Pick a non-empty suffix from the string s where all the characters in this suffix are equal.
    // The prefix and the suffix should not intersect at any index.
    // The characters from the prefix and suffix must be the same.
    // Delete both the prefix and the suffix.
    // Return the minimum length of s after performing the above operation any number of times (possibly zero times).

    // Example 1:
    // Input: s = "ca"
    // Output: 2
    // Explanation: You can't remove any characters, so the string stays as is.

    // Example 2:
    // Input: s = "cabaabac"
    // Output: 0
    // Explanation: An optimal sequence of operations is:
    // - Take prefix = "c" and suffix = "c" and remove them, s = "abaaba".
    // - Take prefix = "a" and suffix = "a" and remove them, s = "baab".
    // - Take prefix = "b" and suffix = "b" and remove them, s = "aa".
    // - Take prefix = "a" and suffix = "a" and remove them, s = "".

    // Example 3:
    // Input: s = "aabccabba"
    // Output: 3
    // Explanation: An optimal sequence of operations is:
    // - Take prefix = "aa" and suffix = "a" and remove them, s = "bccabb".
    // - Take prefix = "b" and suffix = "bb" and remove them, s = "cca".

    // Constraints:
    // 1 <= s.length <= 10^5
    // s only consists of characters 'a', 'b', and 'c'.

    func minimumLength(_ s: String) -> Int {
        var curS = [Character](s)
        while curS.count > 1 && curS.first! == curS.last! {
            let targetChar = curS[0]
            let n = curS.count
            var l = 0
            while l < n && curS[l] == targetChar { l += 1 }
            guard l != curS.count else { return 0 }
            var r = n - 1
            while r >= 0 && curS[r] == targetChar { r -= 1 }
            curS.removeFirst(l)
            curS.removeLast(n - 1 - r)
        }
        return curS.count
    }

}
