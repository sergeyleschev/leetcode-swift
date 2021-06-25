class Solution {

    // 1002. Find Common Characters
    // Given an array words of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.
    // You may return the answer in any order.

    // Example 1:
    // Input: ["bella","label","roller"]
    // Output: ["e","l","l"]

    // Example 2:
    // Input: ["cool","lock","cook"]
    // Output: ["c","o"]

    // Note:
    // 1 <= words.length <= 100
    // 1 <= words[i].length <= 100
    // words[i] consists of lowercase English letters.

    func commonChars(_ A: [String]) -> [String] {
        var minfreq = [Character: Int]()
        
        for i in 0..<A.count {
            let a = A[i]
            var freq = [Character: Int]()
            for c in a {
                if freq[c] == nil {
                    freq[c] = 1
                } else {
                    freq[c]! += 1
                }
            }
            
            if i == 0 { minfreq = freq; continue }
            for key in minfreq.keys {
                if freq[key] == nil {
                    minfreq.removeValue(forKey: key)
                } else {
                    minfreq[key] = min(minfreq[key]!, freq[key]!)
                }
            }
        }
        
        return minfreq.reduce([String]()) { (res, arg1) -> [String] in
            let (key, val) = arg1
            let cs = [String](repeating: String(key), count: val)
            return res + cs;
        }
    }
    
}