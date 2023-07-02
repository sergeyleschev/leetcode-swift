class Solution {

    // Solution by Sergey Leschev

    // 481. Magical String
    // A magical string s consists of only '1' and '2' and obeys the following rules:
    // The string s is magical because concatenating the number of contiguous occurrences of characters '1' and '2' generates the string s itself.
    // The first few elements of s is s = "1221121221221121122……". If we group the consecutive 1's and 2's in s, it will be "1 22 11 2 1 22 1 22 11 2 11 22 ......" and the occurrences of 1's or 2's in each group are "1 2 2 1 1 2 1 2 2 1 2 2 ......". You can see that the occurrence sequence is s itself.
    // Given an integer n, return the number of 1's in the first n number in the magical string s.

    // Example 1:
    // Input: n = 6
    // Output: 3
    // Explanation: The first 6 elements of magical string s is "12211" and it contains three 1's, so return 3.

    // Example 2:
    // Input: n = 1
    // Output: 1

    // Constraints:
    // 1 <= n <= 10^5

    func magicalString(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        var magical = ["1", "2", "2"]
        var p = 2

        while magical.count < n {
            let add = magical.last! == "1" ? "2" : "1"
            if magical[p] == "1" {
                magical.append(add)
            } else {
                magical.append(add)
                magical.append(add)
            }
            p += 1
        }

        if magical.count > n { magical.removeLast() }
        return magical.reduce(0, { (res, str) -> Int in str == "1" ? res + 1 : res })
    }

}
