class Solution {

    // Solution by Sergey Leschev

    // 1888. Minimum Number of Flips to Make the Binary String Alternating
    // You are given a binary string s. You are allowed to perform two types of operations on the string in any sequence:
    // Type-1: Remove the character at the start of the string s and append it to the end of the string.
    // Type-2: Pick any character in s and flip its value, i.e., if its value is '0' it becomes '1' and vice-versa.
    // Return the minimum number of type-2 operations you need to perform such that s becomes alternating.
    // The string is called alternating if no two adjacent characters are equal.
    // For example, the strings "010" and "1010" are alternating, while the string "0100" is not.
     
    // Example 1:
    // Input: s = "111000"
    // Output: 2
    // Explanation: Use the first operation two times to make s = "100011".
    // Then, use the second operation on the third and sixth elements to make s = "101010".

    // Example 2:
    // Input: s = "010"
    // Output: 0
    // Explanation: The string is already alternating.

    // Example 3:
    // Input: s = "1110"
    // Output: 1
    // Explanation: Use the second operation on the second element to make s = "1010".

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is either '0' or '1'.

     func minFlips(_ s: String) -> Int {
         guard s.count > 1 else { return 0 }
         let sToInt = s.map { Int($0.asciiValue! - 48)}
         let n = s.count
         var infos = [[Int]](repeating: [Int](repeating: 0, count: 2), count: s.count + 1)
         var ans = Int.max
         
         infos[1][1 - sToInt[0]] += 1
         
         for idx in 1..<n {
             let j = idx + 1
             let length = idx + 1
             var temp = infos[idx]

             if length % 2 == 0 { temp[sToInt[idx]] += 1 } 
             else { temp[1 - sToInt[idx]] += 1 }
             infos[j] = temp
         }

         for idx in 0..<n {
             let right = n - idx
             let left = idx
             var temp = 0
             
             if left % 2 == 0 {
                 temp = infos[n][sToInt[idx]] - infos[idx][sToInt[idx]]
                 if right % 2 == 0 { temp += infos[idx][sToInt[idx]] } 
                 else { temp += infos[idx][1 - sToInt[idx]] }
             
             } else {
                 temp = infos[n][1 - sToInt[idx]] - infos[idx][1 - sToInt[idx]]
                 if right % 2 == 0 { temp += infos[idx][sToInt[idx]] } 
                 else { temp += infos[idx][1 - sToInt[idx]] }
             }
             ans = min(ans, temp)
         }
         return ans
     }
 
 }