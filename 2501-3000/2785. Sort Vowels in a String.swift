class Solution {

    // Solution by Sergey Leschev
    // 2785. Sort Vowels in a String
    
    // Complexity
    // Time: O(n*logn)
    // Space: O(n)

    func sortVowels(_ s: String) -> String {
        var vow = [Character]()
        var pos = [Int]()

        for (index, char) in s.enumerated() {
            let lowerChar = char.lowercased()
            if lowerChar == "a" || lowerChar == "e" || lowerChar == "i" || lowerChar == "o"
                || lowerChar == "u"
            {
                vow.append(char)
                pos.append(index)
            }
        }

        vow.sort()

        var answer = Array(s)
        for (i, index) in pos.enumerated() {
            answer[index] = vow[i]
        }

        return String(answer)
    }
}
