class Solution {

    // Solution by Sergey Leschev

    // 1202. Smallest String With Swaps
    // You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string.
    // You can swap the characters at any pair of indices in the given pairs any number of times.
    // Return the lexicographically smallest string that s can be changed to after using the swaps.

    // Example 1:
    // Input: s = "dcab", pairs = [[0,3],[1,2]]
    // Output: "bacd"
    // Explanation:
    // Swap s[0] and s[3], s = "bcad"
    // Swap s[1] and s[2], s = "bacd"

    // Example 2:
    // Input: s = "dcab", pairs = [[0,3],[1,2],[0,2]]
    // Output: "abcd"
    // Explanation:
    // Swap s[0] and s[3], s = "bcad"
    // Swap s[0] and s[2], s = "acbd"
    // Swap s[1] and s[2], s = "abcd"

    // Example 3:
    // Input: s = "cba", pairs = [[0,1],[1,2]]
    // Output: "abc"
    // Explanation:
    // Swap s[0] and s[1], s = "bca"
    // Swap s[1] and s[2], s = "bac"
    // Swap s[0] and s[1], s = "abc"

    // Constraints:
    // 1 <= s.length <= 10^5
    // 0 <= pairs.length <= 10^5
    // 0 <= pairs[i][0], pairs[i][1] < s.length
    // s only contains lower case English letters.

    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let characters = Array(s)
        var ans = Array(s)
        var dsu: [Int: Set<Int>] = [:]
        var newPairs: [[Int]] = []

        for pair in pairs {
            if dsu[pair[0]] == nil {
                dsu[pair[0]] = [pair[1]]
            } else {
                dsu[pair[0]]!.insert(pair[1])
            }
            if dsu[pair[1]] == nil {
                dsu[pair[1]] = [pair[0]]
            } else {
                dsu[pair[1]]!.insert(pair[0])
            }
        }

        let keys = dsu.keys

        for key in keys {
            var connection = Set<Int>()
            connect(key, &connection, &dsu)
            if !connection.isEmpty { newPairs.append(Array(connection).sorted(by: <)) }
        }

        for pair in newPairs {
            var array: [Character] = []
            for position in pair { array.append(characters[position]) }
            array.sort(by: <)
            for i in 0..<array.count { ans[pair[i]] = array[i] }
        }

        return String(ans)
    }

    private func connect(_ key: Int, _ connection: inout Set<Int>, _ dsu: inout [Int: Set<Int>]) {
        guard let set = dsu[key] else { return }
        connection.insert(key)
        dsu.removeValue(forKey: key)
        for newKey in set { connect(newKey, &connection, &dsu) }
    }

}
