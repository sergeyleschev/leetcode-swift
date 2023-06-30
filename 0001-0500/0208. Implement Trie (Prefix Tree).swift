class Trie {

    // Solution by Sergey Leschev

    // 208. Implement Trie (Prefix Tree)
    // A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

    // Implement the Trie class:
    // Trie() Initializes the trie object.
    // void insert(String word) Inserts the string word into the trie.
    // boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
    // boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

    // Example 1:
    // Input
    // ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    // [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
    // Output
    // [null, null, true, false, true, null, true]
    // Explanation
    // Trie trie = new Trie();
    // trie.insert("apple");
    // trie.search("apple");   // return True
    // trie.search("app");     // return False
    // trie.startsWith("app"); // return True
    // trie.insert("app");
    // trie.search("app");     // return True

    // Constraints:
    // 1 <= word.length, prefix.length <= 2000
    // word and prefix consist only of lowercase English letters.
    // At most 3 * 10^4 calls in total will be made to insert, search, and startsWith.

    private var root: TrieNode

    init(_ root: TrieNode = TrieNode()) {
        self.root = root
    }


    // Inserts a word into the trie.
    // - Parameter word: The string to insert.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(n), where n is the length of the word.
    
    func insert(_ word: String) {
        var curr: TrieNode? = root

        for w in word {
            if let curr = curr, !curr.contains(w) {
                curr[w] = TrieNode()
            }
            curr = curr?[w]
        }
        curr?.isEnd = true
    }


    // Returns if the word is in the trie.
    // - Parameter word: The string for search.
    // - Returns: True if the word is in the trie, otherwise returns false.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(1), only constant space is used.
    
    func search(_ word: String) -> Bool {
        var curr = root

        for w in word {
            guard let child = curr[w] else { return false }
            curr = child
        }

        return curr.isEnd
    }


    // Returns if there is any word in the trie that starts with the given prefix.
    // - Parameter prefix: The prefix string for search.
    // - Returns: True if there is any word in the trie that starts with the given
    //   prefix, otherwise returns false.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(1), only constant space is used.

    func startsWith(_ prefix: String) -> Bool {
        var curr = root

        for w in prefix {
            guard let child = curr[w] else { return false }
            curr = child
        }

        return true
    }

}


final class TrieNode {
    private var children: [Character: TrieNode]
    var isEnd: Bool


    init(_ children: [Character: TrieNode] = [:], isEnd: Bool = false ) {
        self.children = children
        self.isEnd = isEnd
    }


    func contains(_ key: Character) -> Bool {
        return children.keys.contains(key)
    }


    subscript(_ key: Character) -> TrieNode? {
        set { children[key] = newValue }
        get { children[key] }
    }

}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */