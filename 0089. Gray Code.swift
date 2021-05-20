class Solution {

    // 89. Gray Code
    // The gray code is a binary numeral system where two successive values differ in only one bit.
    // Given an integer n representing the total number of bits in the code, return any sequence of gray code.
    // A gray code sequence must begin with 0.

    // Example 1:
    // Input: n = 2
    // Output: [0,1,3,2]
    // Explanation:
    // 00 - 0
    // 01 - 1
    // 11 - 3
    // 10 - 2
    // [0,2,3,1] is also a valid gray code sequence.
    // 00 - 0
    // 10 - 2
    // 11 - 3
    // 01 - 1

    // Example 2:
    // Input: n = 1
    // Output: [0,1]

    // Constraints:
    // 1 <= n <= 16

    func grayCode(_ n: Int) -> [Int] {
        var arr: [Int] = [0]
        var e = -1
        
        func povv(_ n: Int, _ e: Int) -> Int { return Int(pow(Double(n), Double(e))) }
        
        for i in 1..<povv(2, n) {
            if i == povv(2, e + 1) { e += 1 }
            
            let index = povv(2, e + 1) - i - 1
            let num = povv(2, e) + arr[index]
            arr.append(num)
        }
        
        return arr
    }
    
}