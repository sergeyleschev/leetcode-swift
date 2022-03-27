class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1925. Count Square Sum Triples
    // A square triple (a,b,c) is a triple where a, b, and c are integers and a2 + b2 = c2.
    // Given an integer n, return the number of square triples such that 1 <= a, b, c <= n.

    // Example 1:
    // Input: n = 5
    // Output: 2
    // Explanation: The square triples are (3,4,5) and (4,3,5).

    // Example 2:
    // Input: n = 10
    // Output: 4
    // Explanation: The square triples are (3,4,5), (4,3,5), (6,8,10), and (8,6,10).

    // Constraints:
    // 1 <= n <= 250

    // - Complexity:
    //   - time: O(n^2)
    
    func countTriples(_ n: Int) -> Int {
        var count = 0

        for i in (1..<n) {
            for j in (i + 1..<n) {
                let k = i * i + j * j
                let s = sqrt(Double(k))
                if s == floor(s), s <= Double(n) { count += 1 }
            }
        }
        return count * 2
    }
    
}