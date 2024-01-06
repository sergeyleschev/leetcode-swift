class Solution {

    // Solution by Sergey Leschev
    // 2942. Find Words Containing Character

    // Time complexity: (N * max(length of words))
    // Space complexity: O(N)

    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var result: [Int] = []

        for (index, word) in words.enumerated() {
            if word.contains(x) {
                result.append(index)
            }
        }

        return result
    }
}
