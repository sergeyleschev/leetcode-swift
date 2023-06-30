class Solution {

    // Solution by Sergey Leschev

    // 1405. Longest Happy String
    // A string is called happy if it does not have any of the strings 'aaa', 'bbb' or 'ccc' as a substring.
    // Given three integers a, b and c, return any string s, which satisfies following conditions:
    // s is happy and longest possible.
    // s contains at most a occurrences of the letter 'a', at most b occurrences of the letter 'b' and at most c occurrences of the letter 'c'.
    // s will only contain 'a', 'b' and 'c' letters.
    // If there is no such string s return the empty string "".

    // Example 1:
    // Input: a = 1, b = 1, c = 7
    // Output: "ccaccbcc"
    // Explanation: "ccbccacc" would also be a correct answer.

    // Example 2:
    // Input: a = 2, b = 2, c = 1
    // Output: "aabbc"

    // Example 3:
    // Input: a = 7, b = 1, c = 0
    // Output: "aabaa"
    // Explanation: It's the only correct answer in this case.

    // Constraints:
    // 0 <= a, b, c <= 100
    // a + b + c > 0

    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        if a >= b && a >= c {
            if b >= c {
                return helper(max: (a, "a"), other: (b, "b"), another: (c, "c"))
            } else {
                return helper(max: (a, "a"), other: (c, "c"), another: (b, "b"))
            }
        }

        if b >= a && b >= c {
            if a >= c {
                return helper(max: (b, "b"), other: (a, "a"), another: (c, "c"))
            } else {
                return helper(max: (b, "b"), other: (c, "c"), another: (a, "a"))
            }
        }

        if c >= a && c >= b {
            if a >= b {
                return helper(max: (c, "c"), other: (a, "a"), another: (b, "b"))
            } else {
                return helper(max: (c, "c"), other: (b, "b"), another: (a, "a"))
            }
        }

        return ""
    }


    func helper(max: (count: Int, str: String), other: (count: Int, str: String), another: (count: Int, str: String)) -> String {
        var arrays: [[String]] = []
        var tmp: [String] = []
        var j = 0
        var isDiscard = false


        func handle(tuple: (count: Int, str: String)) {
            for _ in 0 ..< tuple.count {
                arrays[j].append(tuple.str)
                j += 1
                if j >= arrays.count { j = 0 }
            }
        }

        for _ in 0 ..< max.count {
            tmp.append(max.str)
            if tmp.count == 2 { arrays.append(tmp); tmp = [] }
        }

        if !tmp.isEmpty { arrays.append(tmp) }

        handle(tuple: other)
        handle(tuple: another)

        return arrays.filter {
            if $0.count <= 2 && isDiscard == true { return false }
            if $0.count <= 2 { isDiscard = true }
            return true
        }.map { $0.joined() }.joined()
    }

}