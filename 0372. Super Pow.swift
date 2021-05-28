class Solution {

    // 372. Super Pow
    // Your task is to calculate ab mod 1337 where a is a positive integer and b is an extremely large positive integer given in the form of an array.

    // Example 1:
    // Input: a = 2, b = [3]
    // Output: 8

    // Example 2:
    // Input: a = 2, b = [1,0]
    // Output: 1024

    // Example 3:
    // Input: a = 1, b = [4,3,3,8,5,2]
    // Output: 1

    // Example 4:
    // Input: a = 2147483647, b = [2,0,0]
    // Output: 1198

    // Constraints:
    // 1 <= a <= 2^31 - 1
    // 1 <= b.length <= 2000
    // 0 <= b[i] <= 9
    // b doesn't contain leading zeros.

    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var mod = 1337
        var res = 1 
        

        func quickPow(num1: Int, num2: Int) -> Int{
            var num1 = num1
            var num2 = num2
            var res = 1
            num1 %= mod
            
            while num2 > 0 {
                if (num2 & 1) != 0 { res = (res * num1) % mod }
                num1 = (num1 * num1) % mod
                num2 >>= 1
            }
            
            return res
        }
        
        var a = a
        
        for num in b.reversed() {
            res = (res * quickPow(num1: a, num2: num)) % mod
            a = quickPow(num1: a, num2: 10)
        }

        return res
    }
    
}