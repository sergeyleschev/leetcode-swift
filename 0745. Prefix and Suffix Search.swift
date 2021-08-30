class WordFilter {

    // Solution @ Sergey Leschev, Belarusian State University

    // 745. Prefix and Suffix Search
    // Design a special dictionary with some words that searchs the words in it by a prefix and a suffix.
    // Implement the WordFilter class:
    // WordFilter(string[] words) Initializes the object with the words in the dictionary.
    // f(string prefix, string suffix) Returns the index of the word in the dictionary, which has the prefix prefix and the suffix suffix. If there is more than one valid index, return the largest of them. If there is no such word in the dictionary, return -1.

    // Example 1:
    // Input
    // ["WordFilter", "f"]
    // [[["apple"]], ["a", "e"]]
    // Output
    // [null, 0]
    // Explanation
    // WordFilter wordFilter = new WordFilter(["apple"]);
    // wordFilter.f("a", "e"); // return 0, because the word at index 0 has prefix = "a" and suffix = 'e".

    // Constraints:
    // 1 <= words.length <= 15000
    // 1 <= words[i].length <= 10
    // 1 <= prefix.length, suffix.length <= 10
    // words[i], prefix and suffix consist of lower-case English letters only.
    // At most 15000 calls will be made to the function f.

    // Time Complexity:
    //    - init: O(words.count * word.count * word.count)
    //    - f: O(1)
    // Space Complexity: O(words.count * word.count * word.count)

    let words: [String]
    let n: Int

    // key: suffix#prefix
    // value: index of word which has this prefix
    var map = [String: [Int]]()


    init(_ words: [String]) {
        self.words = words
        self.n = words.count

        for i in 0..<n {
            let word = words[i]
            buildMap(word, i)
        }
    }


    func buildMap(_ word: String, _ index: Int) {
        var key = "#"

        let size = word.count
        for s in word.reversed() {
            key.insert(s, at: key.startIndex)
            for p in word{
                key.append(p)
                map[key, default: [Int]()].append(index)
            }
            // clear previous prefix, prepare next append
            key.removeLast(size)
        }
    }


    func f(_ prefix: String, _ suffix: String) -> Int {
        let key = suffix + "#" + prefix
        return map[key]?.last ?? -1
    }

}

/**
 * Your WordFilter object will be instantiated and called as such:
 * let obj = WordFilter(words)
 * let ret_1: Int = obj.f(prefix, suffix)
 */