// Solution by Sergey Leschev

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

class TrieNode {
    var children: [Character: TrieNode]
    var isWord: Bool

    init() {
        children = [:]
        isWord = false
    }
}

class WordDictionary {
    var root: TrieNode

    init() {
        root = TrieNode()
    }

    func addWord(_ word: String) {
        var node = root
        for c in word {
            if let child = node.children[c] {
                node = child
            } else {
                let child = TrieNode()
                node.children[c] = child
                node = child
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        return searchHelper(Array(word), 0, root)
    }

    private func searchHelper(_ word: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return node.isWord
        }

        let c = word[index]

        if c != "." {
            if let child = node.children[c] {
                return searchHelper(word, index+1, child)
            }
            return false
        } else {
            for child in node.children.values {
                if searchHelper(word, index+1, child) {
                    return true
                }
            }
            return false
        }
    }
}