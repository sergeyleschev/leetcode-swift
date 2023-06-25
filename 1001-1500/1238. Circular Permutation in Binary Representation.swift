class Solution {

    // Solution @ Sergey Leschev

    // 1238. Circular Permutation in Binary Representation
    // Given 2 integers n and start. Your task is return any permutation p of (0,1,2.....,2^n -1) such that :
    // p[0] = start
    // p[i] and p[i+1] differ by only one bit in their binary representation.
    // p[0] and p[2^n -1] must also differ by only one bit in their binary representation.

    // Example 1:
    // Input: n = 2, start = 3
    // Output: [3,2,0,1]
    // Explanation: The binary representation of the permutation is (11,10,00,01). 
    // All the adjacent element differ by one bit. Another valid permutation is [3,1,0,2]

    // Example 2:
    // Input: n = 3, start = 2
    // Output: [2,6,7,5,4,0,1,3]
    // Explanation: The binary representation of the permutation is (010,110,111,101,100,000,001,011). 

    // Constraints:
    // 1 <= n <= 16
    // 0 <= start < 2 ^ n

    func circularPermutation(_ n: Int, _ start: Int) -> [Int] {
        var grayCode = createGrayCode(n)
        var i = 0
        
        while grayCode[i] != start { i += 1 }
        
        if i > 0 {
            grayCode.append(contentsOf: grayCode[0..<i])
            grayCode.removeFirst(i)
        }

        return grayCode
    }


    private func createGrayCode(_ bitsCount: Int) -> [Int] {
        var ans = [Int]()
        ans.append(0)
        ans.append(1)

        guard bitsCount > 1 else { return ans }        
        var delta = 1

        for _ in 2...bitsCount {
            delta *= 2
            ans.append(contentsOf: ans.reversed().map{$0 + delta})
        }
        
        return ans
    }

}