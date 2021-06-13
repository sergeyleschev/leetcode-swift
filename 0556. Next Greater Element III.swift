class Solution {

    // 556. Next Greater Element III
    // Given a positive integer n, find the smallest integer which has exactly the same digits existing in the integer n and is greater in value than n. If no such positive integer exists, return -1.
    // Note that the returned integer should fit in 32-bit integer, if there is a valid answer but it does not fit in 32-bit integer, return -1.

    // Finds the smallest integer which has exactly the same digits existing in the
    // integer n and is greater in value than n.

    // - Parameter n: A positive integer.
    // - Returns: The smallest integer if exist, otherwise returns false.

    // Example 1:
    // Input: n = 12
    // Output: 21

    // Example 2:
    // Input: n = 21
    // Output: -1

    // Constraints:
    // 1 <= n <= 2^31 - 1

    // - Complexity:
    //   - time: O(m), where m is the number of digits in n.
    //   - space: O(m), where m is the number of digits in n.
    
   func nextGreaterElement(_ n: Int) -> Int {
        // convert n to digits array
        var digits: [Int] = []
        var n = n
        
        while n != 0 {
            digits.append(n % 10)
            n /= 10
        }
        digits.reverse()
        
        // get next permutation, same solutin as P31
        var i = digits.count - 2
        while i >= 0 && digits[i] >= digits[i + 1] { i -= 1 }
        if i == -1 { return -1 }
        
        var j = digits.count - 1
        while j >= i && digits[i] >= digits[j] { j -= 1 }
        
        digits.swapAt(i, j)
        
        i = i + 1
        j = digits.count - 1
        while i < j {
            digits.swapAt(i, j)
            i += 1
            j -= 1
        }
        
        // convert back to number
        var number = 0
        let limit = 0x7fffffff
        for n in digits {
            if number > (limit - n) / 10 { return -1 } // overflow
            number = number * 10 + n
        }
        
        return number
    }
    
}