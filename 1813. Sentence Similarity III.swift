class Solution {

    // 1813. Sentence Similarity III
    // A sentence is a list of words that are separated by a single space with no leading or trailing spaces. For example, "Hello World", "HELLO", "hello world hello world" are all sentences. Words consist of only uppercase and lowercase English letters.
    // Two sentences sentence1 and sentence2 are similar if it is possible to insert an arbitrary sentence (possibly empty) inside one of these sentences such that the two sentences become equal. For example, sentence1 = "Hello my name is Jane" and sentence2 = "Hello Jane" can be made equal by inserting "my name is" between "Hello" and "Jane" in sentence2.
    // Given two sentences sentence1 and sentence2, return true if sentence1 and sentence2 are similar. Otherwise, return false.

    // Example 1:
    // Input: sentence1 = "My name is Haley", sentence2 = "My Haley"
    // Output: true
    // Explanation: sentence2 can be turned to sentence1 by inserting "name is" between "My" and "Haley".

    // Example 2:
    // Input: sentence1 = "of", sentence2 = "A lot of words"
    // Output: false
    // Explanation: No single sentence can be inserted inside one of the sentences to make it equal to the other.

    // Example 3:
    // Input: sentence1 = "Eating right now", sentence2 = "Eating"
    // Output: true
    // Explanation: sentence2 can be turned to sentence1 by inserting "right now" at the end of the sentence.

    // Example 4:
    // Input: sentence1 = "Luky", sentence2 = "Lucccky"
    // Output: false

    // Constraints:
    // 1 <= sentence1.length, sentence2.length <= 100
    // sentence1 and sentence2 consist of lowercase and uppercase English letters and spaces.
    // The words in sentence1 and sentence2 are separated by a single space.

    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        let wordsOfSentance1 = sentence1.split(separator: " ").map { String($0) }
        let wordsOfSentance2 = sentence2.split(separator: " ").map { String($0) }
        guard wordsOfSentance1.count != wordsOfSentance2.count else { return sentence1 == sentence2 }
        return wordsOfSentance1.count < wordsOfSentance2.count ? check(wordsOfSentance2, wordsOfSentance1) : check(wordsOfSentance1, wordsOfSentance2)
    }


    private func check(_ long: [String], _ short: [String]) -> Bool {
        guard !long.hasSuffix(short)  && !long.hasPreffix(short) else { return true }
        var left = [String]()
        var right = short

        while !right.isEmpty {
            left.append(right.removeFirst())
            guard long.hasPreffix(left) else { continue }
            guard !long.hasSuffix(right) else { return true }
        }
        return false
    }

}


extension Array where Element == String {
    func hasPreffix(_ preffix: [String]) -> Bool {
        for idx in 0..<preffix.count {
            guard self[idx] == preffix[idx] else { return false }
        }
        return true
    }

    func hasSuffix(_ suffix: [String]) -> Bool {
        for idx in 0..<suffix.count { 
            guard self[count - suffix.count + idx] == suffix[idx] else { return false }
        }
        return true
    }
}