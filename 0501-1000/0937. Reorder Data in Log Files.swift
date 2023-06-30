class Solution {

    // Solution by Sergey Leschev

    // 937. Reorder Data in Log Files
    // You are given an array of logs. Each log is a space-delimited string of words, where the first word is the identifier.
    // There are two types of logs:
    // Letter-logs: All words (except the identifier) consist of lowercase English letters.
    // Digit-logs: All words (except the identifier) consist of digits.
    // Reorder these logs so that:
    // The letter-logs come before all digit-logs.
    // The letter-logs are sorted lexicographically by their contents. If their contents are the same, then sort them lexicographically by their identifiers.
    // The digit-logs maintain their relative ordering.
    // Return the final order of the logs.

    // Example 1:
    // Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
    // Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
    // Explanation:
    // The letter-log contents are all different, so their ordering is "art can", "art zero", "own kit dig".
    // The digit-logs have a relative order of "dig1 8 1 5 1", "dig2 3 6".

    // Example 2:
    // Input: logs = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
    // Output: ["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"]

    // Constraints:
    // 1 <= logs.length <= 100
    // 3 <= logs[i].length <= 100
    // All the tokens of logs[i] are separated by a single space.
    // logs[i] is guaranteed to have an identifier and at least one word after the identifier.

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func reorderLogFiles(_ logs: [String]) -> [String] {
        guard !logs.isEmpty else { return [] }
        var orderedDigits = [String]()
        var orderedLetters = [String]()
        var letters = [(key: String, value: String)]()

        for log in logs {
            guard let spaceIndex = log.firstIndex(of: " ") else { fatalError() }
            let startValueIndex = log.index(after: spaceIndex)
            let key = String(log[..<spaceIndex])
            let value = String(log[startValueIndex...])

            if value.first!.isLetter {
                letters.append((key, value))
            } else {
                orderedDigits.append(log)
            }
        }

        letters.sort { $0.value <= $1.value } // only letter-logs's values(ignore id) need to be ordered lexicographically

        for letter in letters { orderedLetters.append(letter.key + " " + letter.value) }
        return orderedLetters + orderedDigits
    }

}