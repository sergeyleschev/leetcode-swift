class Solution {

    // Solution by Sergey Leschev
    // 2825. Make String a Subsequence Using Cyclic Increments

    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        var i = 0
        let str1Array = Array(str1)

        for c in str2 {
            let t: Character =
                (c == "a")
                ? "z" : Character(UnicodeScalar(String(c).unicodeScalars.first!.value - 1)!)

            while i < str1Array.count && (str1Array[i] != c && str1Array[i] != t) {
                i += 1
            }

            if i >= str1Array.count {
                return false
            }

            i += 1
        }

        return true
    }
}
