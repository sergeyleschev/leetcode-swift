class StreamChecker {

    // Solution by Sergey Leschev

    // 1032. Stream of Characters
    // Implement the StreamChecker class as follows:
    // StreamChecker(words): Constructor, init the data structure with the given words.
    // query(letter): returns true if and only if for some k >= 1, the last k characters queried (in order from oldest to newest, including this letter just queried) spell one of the words in the given list.

    // Example:
    // StreamChecker streamChecker = new StreamChecker(["cd","f","kl"]); // init the dictionary.
    // streamChecker.query('a'); // return false
    // streamChecker.query('b'); // return false
    // streamChecker.query('c'); // return false
    // streamChecker.query('d'); // return true, because 'cd' is in the wordlist
    // streamChecker.query('e'); // return false
    // streamChecker.query('f'); // return true, because 'f' is in the wordlist
    // streamChecker.query('g'); // return false
    // streamChecker.query('h'); // return false
    // streamChecker.query('i'); // return false
    // streamChecker.query('j'); // return false
    // streamChecker.query('k'); // return false
    // streamChecker.query('l'); // return true, because 'kl' is in the wordlist

    // Note:
    // 1 <= words.length <= 2000
    // 1 <= words[i].length <= 2000
    // Words will only consist of lowercase English letters.
    // Queries will only consist of lowercase English letters.
    // The number of queries is at most 40000.

    private let trie: TrieNode
    private var stream: [Character]
    private let longestWord: Int


    // Initialization of data structures.
    // - Parameter words: The given words.

    // - Complexity:
    //   - time: O(n * m), where n is the number of given words, and m is the word length.
    //   - space: O(n * m), where n is the number of given words, and m is the word length.
    
    init(_ words: [String]) {
        trie = TrieNode()
        stream = [Character]()
        var longestWord = 0

        for word in words {
            longestWord = max(longestWord, word.count)
            var node = trie
            for ch in word.reversed() {
                if node.children[ch] == nil { node.children[ch] = TrieNode() }
                if let child = node.children[ch] { node = child }
            }
            node.word = true
        }

        self.longestWord = longestWord
    }


    // Finds if the last k characters queried spell one of the words.
    // - Parameter letter: The query.
    // - Returns: True if the word exists in the list, otherwise returns false.

    // - Complexity:
    //   - time: O(m), where m is the max word length.
    //   - space: O(m), where m is the max word length.
    
    func query(_ letter: Character) -> Bool {
        stream.insert(letter, at: 0)
        if stream.count > longestWord { stream.removeLast() }
        var node = trie

        for ch in stream {
            guard !node.word else { return true }
            if let child = node.children[ch] {
                node = child
            } else {
                return false
            }
        }

        return node.word
    }

}


final class TrieNode {
    var children: [Character: TrieNode]
    var word: Bool

    init(children: [Character: TrieNode] = [:], word: Bool = false) {
        self.children = children
        self.word = word
    }

}

/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
 */