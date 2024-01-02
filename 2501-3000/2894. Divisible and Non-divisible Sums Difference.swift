class Solution {

    // Solution by Sergey Leschev
    // 2894. Divisible and Non-divisible Sums Difference

    // Time Complexity: O(n1)
    // Space Complexity: O(n)

    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        let sum1 = (1 + n) * n / 2
        let sum2 = (1 + n / m) * (n / m) * m
        return sum1 - sum2
    }
}
