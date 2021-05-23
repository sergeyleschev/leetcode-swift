class Solution {

	// 126. Word Ladder II
	// A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
	// Every adjacent pair of words differs by a single letter.
	// Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
	// sk == endWord
	// Given two words, beginWord and endWord, and a dictionary wordList, return all the shortest transformation sequences from beginWord to endWord, or an empty list if no such sequence exists. Each sequence should be returned as a list of the words [beginWord, s1, s2, ..., sk].

	// Example 1:
	// Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
	// Output: [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
	// Explanation: There are 2 shortest transformation sequences:
	// "hit" -> "hot" -> "dot" -> "dog" -> "cog"
	// "hit" -> "hot" -> "lot" -> "log" -> "cog"

	// Example 2:
	// Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
	// Output: []
	// Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.

	// Constraints:
	// 1 <= beginWord.length <= 5
	// endWord.length == beginWord.length
	// 1 <= wordList.length <= 1000
	// wordList[i].length == beginWord.length
	// beginWord, endWord, and wordList[i] consist of lowercase English letters.
	// beginWord != endWord
	// All the words in wordList are unique.

    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		guard wordList.contains(endWord) else { return [] }
        var wordSet = Set(wordList)
        var queue: [String] = [beginWord]
		var words: [[String]] = []
		var isLoopEnd = false
		var res:[[String]] = []
		var lastWords: [String] = [endWord]
		var i = 0

        if wordSet.contains(beginWord) { wordSet.remove(beginWord) }
		
        loop: 
        while queue.count > 0 {
			var list: [String] = []
			
            for word in queue {
				let next = nextWords(word, &wordSet)
                list += next
				if next.contains(endWord) {
					isLoopEnd = true
				}
			}
			
            if isLoopEnd { break loop } 
            else {
				queue = list
				words.append(queue)
			}
		}
        
		while i < words.count - 1 {
			var tmp = Set<String>()
			for word0 in words[words.count - 1 - i] {
				for word1 in lastWords {
					if isNext(word0, word1) {
						tmp.insert(word0)
					}
				}
			}
			lastWords = Array(tmp)
			words[words.count - 1 - i] = lastWords
			i += 1
		}
        

		func backtrack(_ path: [String], _ index: Int) {
			if index == words.count {
                if isNext(path[path.count - 1], endWord) { res.append(path + [endWord]) }
				return
			}
            
			var path = path
			for word in words[index] {
				if isNext(path[path.count - 1], word) == false { continue }
                
				path.append(word)
				backtrack(path, index + 1)
				path.remove(at: path.count - 1)
			}
		}
        
		backtrack([beginWord], 0)
		return res
	}

    
	func isNext(_ word0: String, _ word1: String) -> Bool {
		let chars0 = Array(word0)
		let chars1 = Array(word1)
		var count = 0
		
        for i in 0..<word0.count {
			if chars0[i] != chars1[i] {
				count += 1
				if count > 1 { return false }
			}
		}
		
        return count == 1
	}

    
	func nextWords(_ word: String, _ wordSet: inout Set<String>) -> [String] {
		var res: [String] = []
		var chars = Array(word)
		let alphabeta = Array("abcdefghijklmnopqrstvuwxyz")
		
        for (i, char) in chars.enumerated() {
			for c in alphabeta {
				if c == char { continue } 
				else {
					chars[i] = c
					let string = String(chars)
					if wordSet.contains(string) {
						res.append(string)
						wordSet.remove(string)
					}
				}
				
                chars[i] = char
			}
		}
		
        return res
	}

}