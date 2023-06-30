class Solution {

    // Solution by Sergey Leschev

    // 1419. Minimum Number of Frogs Croaking
    // Given the string croakOfFrogs, which represents a combination of the string "croak" from different frogs, that is, multiple frogs can croak at the same time, so multiple “croak” are mixed. Return the minimum number of different frogs to finish all the croak in the given string.
    // A valid "croak" means a frog is printing 5 letters ‘c’, ’r’, ’o’, ’a’, ’k’ sequentially. The frogs have to print all five letters to finish a croak. If the given string is not a combination of valid "croak" return -1.

    // Example 1:
    // Input: croakOfFrogs = "croakcroak"
    // Output: 1 
    // Explanation: One frog yelling "croak" twice.

    // Example 2:
    // Input: croakOfFrogs = "crcoakroak"
    // Output: 2 
    // Explanation: The minimum number of frogs is two. 
    // The first frog could yell "crcoakroak".
    // The second frog could yell later "crcoakroak".

    // Example 3:
    // Input: croakOfFrogs = "croakcrook"
    // Output: -1
    // Explanation: The given string is an invalid combination of "croak" from different frogs.

    // Example 4:
    // Input: croakOfFrogs = "croakcroa"
    // Output: -1

    // Constraints:
    // 1 <= croakOfFrogs.length <= 10^5
    // All characters in the string are: 'c', 'r', 'o', 'a' or 'k'.

    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        var croak = Croak()
        var croakingFrogsCount = 0
        var frogsCount = 0
        
        for c in croakOfFrogs {
            if !croak.addAndCheckValid(with: c) { return -1 }
            if c == "c" { croakingFrogsCount += 1 }
            if c == "k" { croakingFrogsCount -= 1 }
            frogsCount = max(frogsCount, croakingFrogsCount)
        }
        
        return croakingFrogsCount == 0 && croak.isCountEqualed() ? frogsCount : -1
    }
    

    class Croak {
        var c = 0
        var r = 0
        var o = 0
        var a = 0
        var k = 0
        
        func addAndCheckValid(with character: Character) -> Bool {
            switch character {
            case "c": c += 1
            case "r": r += 1
            case "o": o += 1
            case "a": a += 1
            case "k": k += 1
            default: break
            }
            return isCountValid()
        }
        
        func isCountValid() -> Bool { (c >= r) && (r >= o) && (o >= a) && (a >= k) }
        func isCountEqualed() -> Bool { (c == r) && (c == o) && (c == a) && (c == k) }
    }

}