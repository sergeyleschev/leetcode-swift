class Solution {

    // Solution @ Sergey Leschev

    func separateDigits(_ nums: [Int]) -> [Int] {
        var answer = [Int]()
        for num in nums {
            var digits = [Int]()
            var n = num
            while n > 0 {
                digits.append(n % 10)
                n /= 10
            }
            digits.reverse()
            answer.append(contentsOf: digits)
        }
        return answer
    }
}
