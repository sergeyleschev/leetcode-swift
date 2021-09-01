class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 804. Unique Morse Code Words
    // International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
    // For convenience, the full table for the 26 letters of the English alphabet is given below:
    // [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    // Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-..--...", (which is the concatenation "-.-." + ".-" + "-..."). We'll call such a concatenation, the transformation of a word.
    // Return the number of different transformations among all words we have.

    // Finds the number of different transformations among all words.

    // - Parameter words: A list of words.
    // - Returns: The number of different transformations.

    // Example:
    // Input: words = ["gin", "zen", "gig", "msg"]
    // Output: 2
    // Explanation: 
    // The transformation of each word is:
    // "gin" -> "--...-."
    // "zen" -> "--...-."
    // "gig" -> "--...--."
    // "msg" -> "--...--."
    // There are 2 different transformations, "--...-." and "--...--.".
    // Note:
    // The length of words will be at most 100.
    // Each words[i] will have length in range [1, 12].
    // words[i] will only consist of lowercase letters.

    // - Complexity:
    //   - time: O(n), where n is the sum of the lengths of words in the words.
    //   - space: O(m), where m is the length of the words.
    
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var ans = Set<String>()

        for word in words {
            var tmp = ""
            for ch in word {
                guard let morseCh = morse[ch] else { continue }
                tmp = "\(tmp)\(morseCh)"
            }
            guard tmp != "" else { continue }
            ans.insert(tmp)
        }

        return ans.count
    }


    private let morse: [Character: String] = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--.."
    ]

}