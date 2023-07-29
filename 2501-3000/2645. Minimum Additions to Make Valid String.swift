class Solution {

    // Solution by Sergey Leschev
    // 2645. Minimum Additions to Make Valid String
    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func addMinimum(_ word: String) -> Int {
        var k = 0
        var prev: Character = "z"
        for char in word {
            k += char.asciiValue! <= prev.asciiValue! ? 1 : 0
            prev = char
        }
        return k * 3 - word.count
    }
}
