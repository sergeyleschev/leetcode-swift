class Solution {

    // Solution by Sergey Leschev

    // 1734. Decode XORed Permutation
    // There is an integer array perm that is a permutation of the first n positive integers, where n is always odd.
    // It was encoded into another integer array encoded of length n - 1, such that encoded[i] = perm[i] XOR perm[i + 1]. For example, if perm = [1,3,2], then encoded = [2,1].
    // Given the encoded array, return the original array perm. It is guaranteed that the answer exists and is unique.

    // Example 1:
    // Input: encoded = [3,1]
    // Output: [1,2,3]
    // Explanation: If perm = [1,2,3], then encoded = [1 XOR 2,2 XOR 3] = [3,1]

    // Example 2:
    // Input: encoded = [6,5,4,6]
    // Output: [2,4,1,5,3]

    // Constraints:
    // 3 <= n < 10^5
    // n is odd.
    // encoded.length == n - 1

    func decode(_ encoded: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: encoded.count + 1)
        var LastElement = 0
        
        for index in 0...encoded.count {
            if index % 2 == 0 && index < encoded.count{ LastElement ^= encoded[index] }
            LastElement ^= (index + 1)
        }
        
        result[encoded.count] = LastElement
        for index in 1...encoded.count { result[encoded.count - index] = result[encoded.count - index + 1] ^ encoded[encoded.count - index] }
        return result
    }

}