class Solution {

    // Solution by Sergey Leschev

    func vowelStrings(_ words: [String], _ left: Int, _ right: Int) -> Int {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var count = 0

        // Iterate over words in the range [left, right]
        for i in left...right {
            let word = words[i]

            // Check if the first and last characters of the word are vowels
            if vowels.contains(word.first ?? Character(""))
                && vowels.contains(word.last ?? Character(""))
            {
                count += 1
            }
        }

        return count
    }
}
