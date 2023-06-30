class Solution {

    // Solution by Sergey Leschev

    // 1073. Adding Two Negabinary Numbers
    // Given two numbers arr1 and arr2 in base -2, return the result of adding them together.
    // Each number is given in array format:  as an array of 0s and 1s, from most significant bit to least significant bit.  For example, arr = [1,1,0,1] represents the number (-2)^3 + (-2)^2 + (-2)^0 = -3.  A number arr in array, format is also guaranteed to have no leading zeros: either arr == [0] or arr[0] == 1.
    // Return the result of adding arr1 and arr2 in the same format: as an array of 0s and 1s with no leading zeros.

    // Example 1:
    // Input: arr1 = [1,1,1,1,1], arr2 = [1,0,1]
    // Output: [1,0,0,0,0]
    // Explanation: arr1 represents 11, arr2 represents 5, the output represents 16.

    // Example 2:
    // Input: arr1 = [0], arr2 = [0]
    // Output: [0]

    // Example 3:
    // Input: arr1 = [0], arr2 = [1]
    // Output: [1]

    // Constraints:
    // 1 <= arr1.length, arr2.length <= 1000
    // arr1[i] and arr2[i] are 0 or 1
    // arr1 and arr2 have no leading zeros

    func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let reversedArr1 = [Int](arr1.reversed())
        let reversedArr2 = [Int](arr2.reversed())
        var ans  = [Int]()
        var carry = 0
        var i = 0
        
        while i < arr1.count || i < arr2.count || carry != 0 {
            var x = carry
            if i < arr1.count { x += reversedArr1[i] }
            if i < arr2.count { x += reversedArr2[i] }
            ans.append((x + 2) % 2)
            carry = (x - ans.last!) / -2
            i += 1
        }
        
        while !ans.isEmpty && ans.last! == 0 { ans.removeLast() }
        return ans.isEmpty ? [0] : ans.reversed()
    }

 }