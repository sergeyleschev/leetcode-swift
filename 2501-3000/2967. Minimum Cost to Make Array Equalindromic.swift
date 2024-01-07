class Solution {

    // Solution by Sergey Leschev
    // 2967. Minimum Cost to Make Array Equalindromic

    // Time complexity: O(n log n)
    // Space complexity: O(1)

    func minimumCost(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted()
        var med = 0
        let len = sortedNums.count
        med = sortedNums[len / 2]
        let num1 = palindrome1(med)
        let num2 = palindrome2(med)
        let sum1 = findSum(sortedNums, num1)
        let sum2 = findSum(sortedNums, num2)
        return sum1 < sum2 ? sum1 : sum2
    }

    private func palindrome1(_ num: Int) -> Int {
        var num = num
        while !check(num) {
            num -= 1
        }
        return num
    }

    private func palindrome2(_ num: Int) -> Int {
        var num = num
        while !check(num) {
            num += 1
        }
        return num
    }

    private func check(_ n: Int) -> Bool {
        var dup = n
        var rev = 0
        while dup != 0 {
            rev = rev * 10 + (dup % 10)
            dup /= 10
        }
        return rev == n
    }

    private func findSum(_ nums: [Int], _ n: Int) -> Int {
        var sum = 0
        for i in 0..<nums.count {
            sum += abs(n - nums[i])
        }
        return sum
    }
}
