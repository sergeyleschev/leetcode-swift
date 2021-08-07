class Solution {

    // 1799. Maximize Score After N Operations
    // You are given nums, an array of positive integers of size 2 * n. You must perform n operations on this array.
    // In the ith operation (1-indexed), you will:
    // Choose two elements, x and y.
    // Receive a score of i * gcd(x, y).
    // Remove x and y from nums.
    // Return the maximum score you can receive after performing n operations.
    // The function gcd(x, y) is the greatest common divisor of x and y.

    // Example 1:
    // Input: nums = [1,2]
    // Output: 1
    // Explanation: The optimal choice of operations is:
    // (1 * gcd(1, 2)) = 1

    // Example 2:
    // Input: nums = [3,4,6,8]
    // Output: 11
    // Explanation: The optimal choice of operations is:
    // (1 * gcd(3, 6)) + (2 * gcd(4, 8)) = 3 + 8 = 11

    // Example 3:
    // Input: nums = [1,2,3,4,5,6]
    // Output: 14
    // Explanation: The optimal choice of operations is:
    // (1 * gcd(1, 5)) + (2 * gcd(2, 4)) + (3 * gcd(3, 6)) = 1 + 4 + 9 = 14

    // Constraints:
    // 1 <= n <= 7
    // nums.length == 2 * n
    // 1 <= nums[i] <= 10^6

    private let leftShiftResults: [Int] = (0..<14).map { 1 << $0 }


    func maxScore(_ nums: [Int]) -> Int {    
        let n = nums.count
        let maxTime = n >> 1
        var gcdResults = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var memo = [Int: Int]()
        

        func dpSolve(_ visited: Int, _ time: Int) -> Int {
            guard time <= maxTime else { return 0 }
            if let s = memo[visited] { return s }
            var tempScore = 0

            for i in 0..<(n - 1) {
                guard visited & leftShiftResults[i] == 0 else { continue } 
                for j in (i + 1)..<n {
                    guard visited & leftShiftResults[j] == 0 else { continue }
                    tempScore = max(tempScore, time * gcdResults[i][j] + dpSolve(visited | leftShiftResults[i] | leftShiftResults[j], time + 1))
                }
            }
            memo[visited] = tempScore
            return tempScore
        }

        for i in 0..<(n - 1) {
            for j in (i + 1)..<n {
                let ans = gcd(nums[i], nums[j])
                gcdResults[i][j] = ans
                gcdResults[j][i] = ans
            }
        }
        return dpSolve(0,1)
    }


    @inline(__always) private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return a % b == 0 ? b : gcd(b, a % b)
    }
}