class Solution {

    // Solution @ Sergey Leschev

    // 692. Top K Frequent Words
    // Given a non-empty list of words, return the k most frequent elements.
    // Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

    // Example 1:
    // Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
    // Output: ["i", "love"]
    // Explanation: "i" and "love" are the two most frequent words.
    // Note that "i" comes before "love" due to a lower alphabetical order.

    // Example 2:
    // Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
    // Output: ["the", "is", "sunny", "day"]
    // Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
    //     with the number of occurrence being 4, 3, 2 and 1 respectively.
    // Note:
    // You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
    // Input words contain only lowercase letters.
    // Follow up:
    // Try to solve it in O(n log k) time and O(n) extra space.

    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var map = [String : Int]()
        
        for word in words { map[word] = (map[word] ?? 0) + 1 }
        
        var keys = Array(map.keys)
        
        keys.sort(by: {
            if let value1 = map[$0], let value2 = map[$1], value1 != value2 {
                return value1 > value2
            } else {
                return $0 < $1
            }
        })
        
        return Array(keys[0..<k])
    }
    
}