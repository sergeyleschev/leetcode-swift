class WordDictionary {

    // 211. Design Add and Search Words Data Structure
    // Design a data structure that supports adding new words and finding if a string matches any previously added string.
    // Implement the WordDictionary class:
    // WordDictionary() Initializes the object.
    // void addWord(word) Adds word to the data structure, it can be matched later.
    // bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.

    // Example:
    // Input
    // ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
    // [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
    // Output
    // [null,null,null,null,false,true,true,true]
    // Explanation
    // WordDictionary wordDictionary = new WordDictionary();
    // wordDictionary.addWord("bad");
    // wordDictionary.addWord("dad");
    // wordDictionary.addWord("mad");
    // wordDictionary.search("pad"); // return False
    // wordDictionary.search("bad"); // return True
    // wordDictionary.search(".ad"); // return True
    // wordDictionary.search("b.."); // return True

    // Constraints:
    // 1 <= word.length <= 500
    // word in addWord consists lower-case English letters.
    // word in search consist of  '.' or lower-case English letters.
    // At most 50000 calls will be made to addWord and search.

    private var trie: TrieNode

    init() {
        trie = TrieNode()
    }


    // Adds a word into the data structure.
    // - Parameter word: The word.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(n), where n is the length of the word.

    func addWord(_ word: String) {
        var node = trie

        for ch in word {
            if node.children[ch] == nil {
                node.children[ch] = TrieNode()
            }

            if let child = node.children[ch] {
                node = child
            }
        }
        node.word = true
    }


    // Searches for a word in the data structure.
    // - Parameter word: The word.
    // - Returns: True if data structure contains the word, otherwise returns false.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(n), where n is the length of the word.

    func search(_ word: String) -> Bool {
        return searchInNode(word, trie)
    }


    private func searchInNode(_ word: String, _ node: TrieNode) -> Bool {
        var node = node
        let word = Array(word)

        for i in 0..<word.count {
            if let child = node.children[word[i]] {
                node = child

            } else {
                guard word[i] == "." else { return false }

                for child in node.children.values {
                    guard searchInNode(String(word.dropFirst(i + 1)), child) else { continue }
                    return true
                }

                return false
            }
        }

        return node.word
    }
}


final class TrieNode {
    var children: [Character: TrieNode]
    var word: Bool

    init(children: [Character: TrieNode] = [Character: TrieNode](), word: Bool = false) {
        self.children = children
        self.word = word
    }

}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */