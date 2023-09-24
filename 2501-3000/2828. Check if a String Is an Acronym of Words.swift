class Solution {

    // Solution by Sergey Leschev
    // 2828. Check if a String Is an Acronym of Words

    func isAcronym(_ words: [String], _ s: String) -> Bool {
        var acronym = ""

        for word in words {
            if !word.isEmpty {
                acronym.append(word.first!)
            }
        }

        return acronym == s
    }
}
