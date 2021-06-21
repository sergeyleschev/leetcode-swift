class Solution {

    // 842. Split Array into Fibonacci Sequence
    // You are given a string of digits num, such as "123456579". We can split it into a Fibonacci-like sequence [123, 456, 579].
    // Formally, a Fibonacci-like sequence is a list f of non-negative integers such that:
    // 0 <= f[i] < 231, (that is, each integer fits in a 32-bit signed integer type),
    // f.length >= 3, and
    // f[i] + f[i + 1] == f[i + 2] for all 0 <= i < f.length - 2.
    // Note that when splitting the string into pieces, each piece must not have extra leading zeroes, except if the piece is the number 0 itself.
    // Return any Fibonacci-like sequence split from num, or return [] if it cannot be done.

    // Example 1:
    // Input: num = "123456579"
    // Output: [123,456,579]

    // Example 2:
    // Input: num = "11235813"
    // Output: [1,1,2,3,5,8,13]

    // Example 3:
    // Input: num = "112358130"
    // Output: []
    // Explanation: The task is impossible.

    // Example 4:
    // Input: num = "0123"
    // Output: []
    // Explanation: Leading zeroes are not allowed, so "01", "2", "3" is not valid.

    // Example 5:
    // Input: num = "1101111"
    // Output: [11,0,11,11]
    // Explanation: The output [11, 0, 11, 11] would also be accepted.

    // Constraints:
    // 1 <= num.length <= 200
    // num contains only digits.

    var S: [Character] = []
    var ans: [Int] = []
    
    
    
    func splitIntoFibonacci(_ S: String) -> [Int] {
        self.S = Array(S)
        backTrace(0, 0, 0)
        return ans
    }
    
    
    func backTrace(_ startIndex: Int, _ sum: Int, _ prev: Int) -> Bool {
        if startIndex == S.count { return ans.count > 2 }
        var cur: Int64 = 0
        let zero = Character("0")
        
        for i in startIndex..<S.count {
            if i > startIndex && S[startIndex] == zero { break }
            let val = S[i].asciiValue! - zero.asciiValue!
            cur = cur * 10 + Int64(val)
            if cur > Int32.max { break }
            if ans.count >= 2 {
                if cur < sum {
                    continue
                } else if cur > sum {
                    break
                }
            }
            
            ans.append(Int(cur))
            let res = backTrace(i + 1, prev + Int(cur), Int(cur))
            if !res && !ans.isEmpty {
                ans.removeLast()
            } else {
                return res
            }
        }
        
        return false
    }
    
}