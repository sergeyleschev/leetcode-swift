class Solution {

    // Solution by Sergey Leschev

    // 788. Rotated Digits
    // x is a good number if after rotating each digit individually by 180 degrees, we get a valid number that is different from x. Each digit must be rotated - we cannot choose to leave it alone.
    // A number is valid if each digit remains a digit after rotation. 0, 1, and 8 rotate to themselves; 2 and 5 rotate to each other (on this case they are rotated in a different direction, in other words 2 or 5 gets mirrored); 6 and 9 rotate to each other, and the rest of the numbers do not rotate to any other number and become invalid.
    // Now given a positive number n, how many numbers x from 1 to n are good?

    // Example:
    // Input: 10
    // Output: 4
    // Explanation:
    // There are four good numbers in the range [1, 10] : 2, 5, 6, 9.
    // Note that 1 and 10 are not good numbers, since they remain unchanged after rotating.
    // Note:
    // n will be in range [1, 10000].

    func rotatedDigits(_ N: Int) -> Int {
        var count = 0
        for i in 1...N where isValid(i) { count += 1 }
        return count
    }

    private func isValid(_ N: Int) -> Bool {
        var N = N
        var valid = false

        while N > 0 {
            if N % 10 == 2 || N % 10 == 5 || N % 10 == 6 || N % 10 == 9 { valid = true }
            if N % 10 == 3 || N % 10 == 4 || N % 10 == 7 { return false }
            N /= 10
        }

        return valid
    }

}
