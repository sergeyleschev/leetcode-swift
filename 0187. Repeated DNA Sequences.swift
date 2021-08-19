class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 187. Repeated DNA Sequences
    // The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.
    // For example, "ACGAATTCCG" is a DNA sequence.
    // When studying DNA, it is useful to identify repeated sequences within the DNA.
    // Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

    // Finds all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.

    // - Parameter s: The DNA.
    // - Returns: All the 10-letter-long sequences that occur more than once.

    // - Complexity:
    //   - time: O(n), where n is the length of the DNA.
    //   - space: O(n), where n is the length of the DNA.

    // Example 1:
    // Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
    // Output: ["AAAAACCCCC","CCCCCAAAAA"]

    // Example 2:
    // Input: s = "AAAAAAAAAAAAA"
    // Output: ["AAAAAAAAAA"]

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is either 'A', 'C', 'G', or 'T'.

    private let dict: [Character: Int] = ["A": 0, "C": 1, "G": 2, "T": 3]
    private let L = 10
    private let a = 4
    

    private var aL: Int {
        Int(pow(Double(a), Double(L)))
    }


    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > L else { return [] }

        var nums = [Int]()

        for s in s {
            guard let num = dict[s] else { continue }
            nums.append(num)
        }

        var h = 0
        var seen = Set<Int>()
        var ans = Set<String>()

        for start in 0..<(s.count - L + 1) {
            if start != 0 {
                h = h * a - nums[start - 1] * aL + nums[start + L - 1]
            } else {
                for i in 0..<L {
                    h = h * a + nums[i]
                }
            }

            if seen.contains(h) {
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let endIndex = s.index(s.startIndex, offsetBy: start + L)
                ans.insert(String(s[startIndex..<endIndex]))
            }
            seen.insert(h)
        }

        return Array(ans)
    }

}