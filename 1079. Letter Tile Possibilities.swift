class Solution {

    // 1079. Letter Tile Possibilities
    // You have n  tiles, where each tile has one letter tiles[i] printed on it.
    // Return the number of possible non-empty sequences of letters you can make using the letters printed on those tiles.

    // Example 1:
    // Input: tiles = "AAB"
    // Output: 8
    // Explanation: The possible sequences are "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA".

    // Example 2:
    // Input: tiles = "AAABBC"
    // Output: 188

    // Example 3:
    // Input: tiles = "V"
    // Output: 1

    // Constraints:
    // 1 <= tiles.length <= 7
    // tiles consists of uppercase English letters.

    var ans: Set<String> = Set()


    func numTilePossibilities(_ tiles: String) -> Int {
        recursive("", Array(tiles))
        return ans.count
    }
    
    
    func recursive(_ prefix: String, _ tiles: [Character]) {
        for i in 0..<tiles.count {
            let tile = tiles[i]
            let prefix = prefix + String(tile)
            ans.insert(prefix)
            var copy = tiles
            copy.remove(at: i)
            recursive(prefix, copy)
        }    
    }

}