class Solution {

    // 483. Smallest Good Base
    // Given an integer n represented as a string, return the smallest good base of n.
    // We call k >= 2 a good base of n, if all digits of n base k are 1's.

    // Example 1:
    // Input: n = "13"
    // Output: "3"
    // Explanation: 13 base 3 is 111.

    // Example 2:
    // Input: n = "4681"
    // Output: "8"
    // Explanation: 4681 base 8 is 11111.

    // Example 3:
    // Input: n = "1000000000000000000"
    // Output: "999999999999999999"
    // Explanation: 1000000000000000000 base 999999999999999999 is 11.

    // Constraints:
    // n is an integer in the range [3, 1018].
    // n does not contain any leading zeros.

    func smallestGoodBase(_ n: String) -> String {
        let number = Int(n)!
        var ans = number - 1
        

        func check(_ exponent: Int) -> Int? {
            let base = Int(pow(Double(number), 1.0 / Double(exponent)))
            var val = 0
            guard base > 1 else { return nil }
            for _ in 0...exponent { val = val * base + 1 }
            return val == number ? base : nil
        }
        

        for exponent in stride(from: 59, through: 2, by: -1) {
            if let base = check(exponent) { ans = base }
        }
        return "\(ans)"
    }

}