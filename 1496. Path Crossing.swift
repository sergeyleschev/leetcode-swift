class Solution {

    // 1496. Path Crossing
    // Given a string path, where path[i] = 'N', 'S', 'E' or 'W', each representing moving one unit north, south, east, or west, respectively. You start at the origin (0, 0) on a 2D plane and walk on the path specified by path.
    // Return true if the path crosses itself at any point, that is, if at any time you are on a location you have previously visited. Return false otherwise.

    // Example 1:
    // Input: path = "NES"
    // Output: false 
    // Explanation: Notice that the path doesn't cross any point more than once.

    // Example 2:
    // Input: path = "NESWW"
    // Output: true
    // Explanation: Notice that the path visits the origin twice.

    // Constraints:
    // 1 <= path.length <= 10^4
    // path[i] is either 'N', 'S', 'E', or 'W'.

    func isPathCrossing(_ path: String) -> Bool {
        var cur = 0 * 10_001 + 0
        var set = Set<Int>([cur])

        return path.first { c in
            switch(c) {
            case "N": cur += 1
            case "S": cur -= 1
            case "E": cur += 10001
            case "W": cur -= 10001
            default: return false
            }
            defer { set.insert(cur) }
            return set.contains(cur)
        } != nil
    }

}