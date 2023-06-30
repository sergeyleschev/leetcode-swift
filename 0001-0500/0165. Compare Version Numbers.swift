class Solution {

    // Solution by Sergey Leschev

    // 165. Compare Version Numbers
    // Given two version numbers, version1 and version2, compare them.
    // Version numbers consist of one or more revisions joined by a dot '.'. Each revision consists of digits and may contain leading zeros. Every revision contains at least one character. Revisions are 0-indexed from left to right, with the leftmost revision being revision 0, the next revision being revision 1, and so on. For example 2.5.33 and 0.1 are valid version numbers.
    // To compare version numbers, compare their revisions in left-to-right order. Revisions are compared using their integer value ignoring any leading zeros. This means that revisions 1 and 001 are considered equal. If a version number does not specify a revision at an index, then treat the revision as 0. For example, version 1.0 is less than version 1.1 because their revision 0s are the same, but their revision 1s are 0 and 1 respectively, and 0 < 1.

    // Return the following:
    // If version1 < version2, return -1.
    // If version1 > version2, return 1.
    // Otherwise, return 0.

    // Example 1:
    // Input: version1 = "1.01", version2 = "1.001"
    // Output: 0
    // Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

    // Example 2:
    // Input: version1 = "1.0", version2 = "1.0.0"
    // Output: 0
    // Explanation: version1 does not specify revision 2, which means it is treated as "0".

    // Example 3:
    // Input: version1 = "0.1", version2 = "1.1"
    // Output: -1
    // Explanation: version1's revision 0 is "0", while version2's revision 0 is "1". 0 < 1, so version1 < version2.

    // Example 4:
    // Input: version1 = "1.0.1", version2 = "1"
    // Output: 1

    // Example 5:
    // Input: version1 = "7.5.2.4", version2 = "7.5.3"
    // Output: -1

    // Constraints:
    // 1 <= version1.length, version2.length <= 500
    // version1 and version2 only contain digits and '.'.
    // version1 and version2 are valid version numbers.
    // All the given revisions in version1 and version2 can be stored in a 32-bit integer.

    // Compares two version numbers.

    // - Parameters:
    //   - version1: First version.
    //   - version2: Second version.
    // - Returns: 1 if version1 is greater than version2, -1 if version2 is greater than version1, otherwise returns 0.

    // - Complexity:
    //   - time: O(max(n,m)), where n is the length of version1, and m is the length of version2.
    //   - space: O(max(n,m)), where n is the length of version1, and m is the length of version2.

    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var i = 0
        var j = 0

        while i < version1.count || j < version2.count {
            let v1 = getNextChunk(version1, i)
            let v2 = getNextChunk(version2, j)

            i = v1.nextIndex
            j = v2.nextIndex

            guard v1.ver != v2.ver else { continue }
            return v1.ver > v2.ver ? 1 : -1
        }

        return 0
    }


    private func getNextChunk(_ version: String, _ index: Int) -> (ver: Int, nextIndex: Int) {
        guard index < version.count else { return (0, index) }

        var cur = ""
        for (i, ch) in version.enumerated() where i >= index {
            guard ch != "." else { break }

            cur = "\(cur)\(ch)"
        }

        return (Int(cur) ?? 0, index + cur.count + 1)
    }

}