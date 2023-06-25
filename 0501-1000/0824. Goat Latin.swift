class Solution {

    // Solution @ Sergey Leschev

    // 824. Goat Latin
    // A sentence sentence is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.
    // We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
    // The rules of Goat Latin are as follows:
    // If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
    // For example, the word 'apple' becomes 'applema'.
    // If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
    // For example, the word "goat" becomes "oatgma".
    // Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
    // For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
    // Return the final sentence representing the conversion from sentence to Goat Latin. 

    // Converts the sentence to "Goat Latin".

    // - Parameter S: The sentence.
    // - Returns: The sentence representing the conversion to Goat Latin.

    // Example 1:
    // Input: sentence = "I speak Goat Latin"
    // Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"

    // Example 2:
    // Input: sentence = "The quick brown fox jumped over the lazy dog"
    // Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"

    // Notes:
    // sentence contains only uppercase, lowercase and spaces. Exactly one space between each word.
    // 1 <= sentence.length <= 150.

    // - Complexity:
    //   - time: O(n), where n is the length of the sentence.
    //   - space: O(m), where m is the length of the sentence on Goat Latin.
    
    func toGoatLatin(_ S: String) -> String {
        let vowels = Set(arrayLiteral: "a","e","i","o","u")
        var ans = S.split(separator: " ")

        for i in 0..<ans.count {
            if let first = ans[i].first?.lowercased(), !vowels.contains(first) {
                ans[i].append(ans[i].removeFirst())
            }
            ans[i].append(contentsOf: "ma")
            ans[i].append(contentsOf: String(repeating: "a", count: i + 1))
        }

        return ans.joined(separator: " ")
    }

}