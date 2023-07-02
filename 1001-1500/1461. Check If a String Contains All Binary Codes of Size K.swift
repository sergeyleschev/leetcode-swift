class Solution {

    // Solution by Sergey Leschev

    // 1461. Check If a String Contains All Binary Codes of Size K
    // Given a binary string s and an integer k.

    // Return true if every binary code of length k is a substring of s. Otherwise, return false.

    // Example 1:
    // Input: s = "00110110", k = 2
    // Output: true
    // Explanation: The binary codes of length 2 are "00", "01", "10" and "11". They can be all found as substrings at indicies 0, 1, 3 and 2 respectively.

    // Example 2:
    // Input: s = "00110", k = 2
    // Output: true

    // Example 3:
    // Input: s = "0110", k = 1
    // Output: true
    // Explanation: The binary codes of length 1 are "0" and "1", it is clear that both exist as a substring.

    // Example 4:
    // Input: s = "0110", k = 2
    // Output: false
    // Explanation: The binary code "00" is of length 2 and doesn't exist in the array.

    // Example 5:
    // Input: s = "0000000001011100", k = 4
    // Output: false

    // Constraints:
    // 1 <= s.length <= 5 * 10^5
    // s[i] is either '0' or '1'.
    // 1 <= k <= 20

    // Solution: rolling hash
    // optimize space
    // map each string to a number in [0, 2^(k-1)]
    // For example, say s="11010110", and k=3, and we just finish calculating the hash of the first substring: "110" (hash is 4+2=6, or 110). Now we want to know the next hash, which is the hash of "101".
    // We can start from the binary form of our hash, which is 110. First, we shift left, resulting 1100. We do not need the first digit, so it is a good idea to do 1100 & 111 = 100. The all-one 111 helps us to align the digits. Now we need to apply the lowest digit of "101", which is 1, to our hash, and by using |, we get 100 | last_digit = 100 | 1 = 101.
    // Write them together, we have: new_hash = ((old_hash << 1) & all_one) | last_digit_of_new_hash.

    // - Complexity:
    //   - time: O(nk)
    //   - space: (2^k)

    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        var possible = 1 << k
        var check = Array(repeating: false, count: possible)
        let allOne = possible - 1
        var hashVal = 0
        var s = Array(s)

        for i in 0..<s.count {
            hashVal = ((hashVal << 1) & allOne) | (s[i].wholeNumberValue!)
            if i >= k - 1, !check[hashVal] {
                check[hashVal] = true
                possible -= 1
                if possible == 0 { return true }
            }
        }

        return false
    }

}
