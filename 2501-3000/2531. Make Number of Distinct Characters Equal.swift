class Solution {

    // Solution by Sergey Leschev
    // 2531. Make Number of Distinct Characters Equal

    func insertAndRemove(_ mp: inout [Character: Int], _ toInsert: Character, _ toRemove: Character)
    {
        mp[toInsert, default: 0] += 1
        mp[toRemove, default: 0] -= 1
        if mp[toRemove] == 0 {
            mp.removeValue(forKey: toRemove)
        }
    }

    func isItPossible(_ word1: String, _ word2: String) -> Bool {
        var mp1: [Character: Int] = [:]
        var mp2: [Character: Int] = [:]

        for w1 in word1 {
            mp1[w1, default: 0] += 1
        }

        for w2 in word2 {
            mp2[w2, default: 0] += 1
        }

        for asciiValue in 97...122 {  // ASCII values of 'a' to 'z'
            let c1 = Character(UnicodeScalar(asciiValue)!)
            for asciiValue2 in 97...122 {
                let c2 = Character(UnicodeScalar(asciiValue2)!)

                if mp1[c1] == nil || mp2[c2] == nil {
                    continue
                }

                insertAndRemove(&mp1, c2, c1)
                insertAndRemove(&mp2, c1, c2)

                if mp1.count == mp2.count {
                    return true
                }

                // Reset back the maps
                insertAndRemove(&mp1, c1, c2)
                insertAndRemove(&mp2, c2, c1)
            }
        }

        return false
    }
}
