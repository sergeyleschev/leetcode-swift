class Solution {

    // Solution @ Sergey Leschev

    // 1012. Numbers With Repeated Digits
    // Given a positive integer n, return the number of positive integers less than or equal to n that have at least 1 repeated digit.

    // Example 1:
    // Input: n = 20
    // Output: 1
    // Explanation: The only positive number (<= 20) with at least 1 repeated digit is 11.

    // Example 2:
    // Input: n = 100
    // Output: 10
    // Explanation: The positive numbers (<= 100) with atleast 1 repeated digit are 11, 22, 33, 44, 55, 66, 77, 88, 99, and 100.

    // Example 3:
    // Input: n = 1000
    // Output: 262

    // Note:
    // 1 <= n <= 10^9

    private var memo = [Int:Int]()
    private var upperBound = [Int]()
    

    func numDupDigitsAtMostN(_ n: Int) -> Int {    
        self.upperBound = caculateUpperBound(of: n)
        self.memo = [:]
        return n - dfs(self.upperBound.count - 1, 0, 0, 0) + 1
    }
    

    private func caculateUpperBound(of num: Int) -> [Int] {
        var ans = [Int]()
        var n = num
        while n > 0 {
            ans.append(n % 10)
            n /= 10
        }
        return ans
    }
    

    private func dfs(_ curPos: Int, _ preNum: Int, _ targetMax: Int, _ usedDigits: Int) -> Int {
        guard curPos >= 0 else { return 1 }
        var ret = 0
        let key = (usedDigits << 32) | curPos
        
        if preNum < targetMax && preNum != 0 { guard nil == self.memo[key] else { return self.memo[key]! } }
        let upperLimit = preNum < targetMax ? 9 : self.upperBound[curPos]

        for num in 0...upperLimit where usedDigits & (1 << num) == 0 { 
            ret += dfs(curPos - 1, preNum * 10 + num, targetMax * 10 + self.upperBound[curPos], preNum + num == 0 ? 0 : (usedDigits | (1 << num)) ) 
        }
        
        if preNum < targetMax && preNum != 0 { self.memo[key] = ret }
        return ret
    }

}