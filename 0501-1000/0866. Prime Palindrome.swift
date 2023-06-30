class Solution {

    // Solution by Sergey Leschev

    // 866. Prime Palindrome
    // Find the smallest prime palindrome greater than or equal to n.
    // Recall that a number is prime if it's only divisors are 1 and itself, and it is greater than 1. 
    // For example, 2,3,5,7,11 and 13 are primes.
    // Recall that a number is a palindrome if it reads the same from left to right as it does from right to left. 
    // For example, 12321 is a palindrome.

    // Example 1:
    // Input: n = 6
    // Output: 7

    // Example 2:
    // Input: n = 8
    // Output: 11

    // Example 3:
    // Input: n = 13
    // Output: 101

    // Note:
    // 1 <= n <= 10^8
    // The answer is guaranteed to exist and be less than 2 * 10^8.

    func primePalindrome(_ N: Int) -> Int {
        for num in arr where num >= N { return num }
        return 100030001
    }
}


let arr = createPalindromeNumbers(8)


func createPalindromeNumbers(_ count: Int) -> [Int] {
    var ans: [Int] = [11, 33, 77, 99]
    guard count != 2 else { return ans }
    var last: [[Int]] = ans.map{ $0.toArr }

    ans.insert(7, at: 0)
    ans.insert(5, at: 0)
    ans.insert(3, at: 0)
    ans.insert(2, at: 0)
        
    for _ in 3...count {
        let length = last.count
        for _ in 0..<length {
            let arr = last.removeFirst()
            if arr.count % 2 == 0 {
                for i in 0...9 {
                    var temp = arr
                    temp.insert(i, at: arr.count >> 1)
                    last.append(temp)
                }
            } else {
                var temp = arr
                let num = arr[arr.count >> 1]
                temp.insert(num, at: arr.count >> 1)
                last.append(temp)
            }
        }
        ans.append(contentsOf: last.map({ $0.toNumber }))
    }
    ans = ans.filter{ $0.isPrimeNumber }
    ans.sort()
    return ans
}


extension Int {
    var toArr: [Int] {
        var ans = [Int]()
        var temp = self
        while temp > 0 {
            ans.insert(temp % 10, at: 0)
            temp /= 10
        }
        return ans
    }


    var isPalindrome: Bool { toArr.reversed() == toArr }


    var isPrimeNumber: Bool {
        if self < 2 { return true }
        let squreRoot = Int(sqrt(Double(self)))
        var i = 2
        while i <= squreRoot {
            if self % i == 0 { return false }
            i += 1
        }
        return true
    }
}


extension Array where Element == Int {
    var toNumber: Int {
        var ans = 0
        for i in 0..<count { ans = ans * 10 + self[i] }
        return ans
    }
}