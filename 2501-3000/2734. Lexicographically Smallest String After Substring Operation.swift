class Solution {

    // Solution by Sergey Leschev
    // 2734. Lexicographically Smallest String After Substring Operation

    func smallestString(_ s: String) -> String {
        var characters = Array(s)  // Convert to mutable array
        var i = 0
        while i < characters.count && characters[i] == "a" {
            i += 1
        }

        if i >= characters.count {
            characters[characters.count - 1] = "z"
            return String(characters)
        }

        while i < characters.count && characters[i] != "a" {
            if let asciiValue = characters[i].asciiValue, asciiValue > 97 {
                characters[i] = Character(UnicodeScalar(asciiValue - 1))
            }
            i += 1
        }

        return String(characters)
    }
}
