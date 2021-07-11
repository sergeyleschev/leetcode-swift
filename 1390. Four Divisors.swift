class Solution {

    // 1390. Four Divisors
    // Given an integer array nums, return the sum of divisors of the integers in that array that have exactly four divisors.
    // If there is no such integer in the array, return 0.

    // Example 1:
    // Input: nums = [21,4,7]
    // Output: 32
    // Explanation:
    // 21 has 4 divisors: 1, 3, 7, 21
    // 4 has 3 divisors: 1, 2, 4
    // 7 has 2 divisors: 1, 7
    // The answer is the sum of divisors of 21 only.

    // Constraints:
    // 1 <= nums.length <= 10^4
    // 1 <= nums[i] <= 10^5

    func sumFourDivisors(_ nums: [Int]) -> Int {
        var ans = 0


        func fourDivisorsSum(of num: Int) -> Int? {
            var divisorsCount = 0
            var ans = 0
            for i in 1...Int(sqrt(Double(num))) {
                if num % i == 0 {
                    let another = num / i
                    if i == another {
                        ans += i
                        divisorsCount += 1
                    } else {
                        ans += i + another
                        divisorsCount += 2
                    }
                    guard divisorsCount <= 4 else { return nil }
                }
            }
            return divisorsCount == 4 ? ans : nil
        }

        for num in nums { if let s = fourDivisorsSum(of: num) { ans += s } }
        return ans
    }

}