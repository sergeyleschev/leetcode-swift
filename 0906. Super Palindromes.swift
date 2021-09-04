class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 906. Super Palindromes
    // Let's say a positive integer is a super-palindrome if it is a palindrome, and it is also the square of a palindrome.
    // Given two positive integers left and right represented as strings, return the number of super-palindromes integers in the inclusive range [left, right].

    // Example 1:
    // Input: left = "4", right = "1000"
    // Output: 4
    // Explanation: 4, 9, 121, and 484 are superpalindromes.
    // Note that 676 is not a superpalindrome: 26 * 26 = 676, but 26 is not a palindrome.

    // Example 2:
    // Input: left = "1", right = "2"
    // Output: 1

    // Constraints:
    // 1 <= left.length, right.length <= 18
    // left and right consist of only digits.
    // left and right cannot have leading zeros.
    // left and right represent integers in the range [1, 10^18 - 1].
    // left is less than or equal to right.

    // Solution:
    // - Say P = R^2is a super palindrome.
    // - Because RR is a palindrome, the first half of the digits in RR determine RR up to two possibilities. We can iterate through these digits: let kk be the first half of the digits in RR. For example, if k = 12344, then R = 1234321 or R = 12344321. Each possibility has either an odd or an even number of digits in RR.
    // - Notice because P < 10^{18}, R < (10^{18})^{\frac{1}{2}} = 10^9, and R = k | k', where k' is k reversed (and also possibly truncated by one digit); so that k < 10^5 = \small\text{MAGIC}, our magic constant.
    
    // Algorithm
    // - For each 1≤k<MAGIC, let's create the associated palindrome R, and check whether R^2 is a palindrome.
    // - We should handle the odd and even possibilities separately, as we would like to break early so as not to do extra work.
    // To check whether an integer is a palindrome, we could check whether it is equal to its reverse. To create the reverse of an integer, we can do it digit by digit.
    
    // - Complexity:
    //   - time: O(W^{\frac{1}{4}} * \log W), where W = 10^{18} is our upper limit for RR. The \log WlogW term comes from checking whether each candidate is the root of a palindrome.
    //   - space: O(logW), the space used to create the candidate palindrome.

    func superpalindromesInRange(_ left: String, _ right: String) -> Int {
        let left = Int(left)!
        let right = Int(right)!
        let limit = 100000
        var finded = 0

        // count odd string
        for i in 1..<limit {
            var str = String(i)
            var oddStr = str
            if str.count > 1 {
                str.removeLast()
                oddStr.append(contentsOf: str.reversed())
            }
            var oddStrNum = Int(oddStr)!
            oddStrNum *= oddStrNum
            if oddStrNum > right { break }
            if oddStrNum >= left, isPalindrome(oddStrNum) { finded += 1 }
        }

        // count even string
        for i in 1..<limit {
            var str = String(i)
            var evenStr = str
            evenStr.append(contentsOf: str.reversed())
            var evenStrNum = Int(evenStr)!
            evenStrNum *= evenStrNum
            if evenStrNum > right { break }
            if evenStrNum >= left, isPalindrome(evenStrNum) { finded += 1 }
        }

        return finded
    }


    func isPalindrome(_ num: Int) -> Bool { num == reverse(num) }


    func reverse(_ num: Int) -> Int {
        var res = 0
        var num = num
        while num != 0 {
            res = res*10 + num%10
            num /= 10
        }
        return res
    }

}