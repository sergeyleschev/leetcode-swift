class Solution {

    // Solution by Sergey Leschev

    // 784. Letter Case Permutation
    // Given a string s, we can transform every letter individually to be lowercase or uppercase to create another string.
    // Return a list of all possible strings we could create. You can return the output in any order.

    // Finds a list of all possible strings we could create.

    // - Parameter S: A string.
    // - Returns: A list of all possible strings.

    // Example 1:
    // Input: s = "a1b2"
    // Output: ["a1b2","a1B2","A1b2","A1B2"]

    // Example 2:
    // Input: s = "3z4"
    // Output: ["3z4","3Z4"]

    // Example 3:
    // Input: s = "12345"
    // Output: ["12345"]

    // Example 4:
    // Input: s = "0"
    // Output: ["0"]

    // Constraints:
    // s will be a string with length between 1 and 12.
    // s will consist only of letters or digits.

    // - Complexity:
    //   - time: O(2^n * n), where n is the length of S.
    //   - space: O(2^n * n), where n is the length of S.

    func letterCasePermutation(_ S: String) -> [String] {
        var ans = [[Character]]()
        ans.append([])

        for ch in S {
            let n = ans.count
            if ch.isLetter {
                for i in 0..<n {
                    ans.append(ans[i])
                    ans[i].append(Character(ch.lowercased()))
                    ans[n + i].append(Character(ch.uppercased()))
                }
            } else {
                for i in 0..<n { ans[i].append(ch) }
            }
        }

        return ans.map { String($0) }
    }

}
