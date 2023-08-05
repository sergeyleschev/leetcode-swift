class Solution {

    // Solution by Sergey Leschev
    // 2788. Split Strings by Separator

    // Time complexity: O(n∗k) where k is length of each array index
    // Space complexity: O(k)

    func splitWordsBySeparator(_ words: [String], _ separator: Character) -> [String] {
        var result = [String]()

        for word in words {
            let components = word.split(separator: separator)
            for component in components {
                if !component.isEmpty {
                    result.append(String(component))
                }
            }
        }

        return result
    }
}
