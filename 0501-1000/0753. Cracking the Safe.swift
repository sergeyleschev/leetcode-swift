class Solution {

    // Solution @ Sergey Leschev

    // 753. Cracking the Safe
    // There is a box protected by a password. The password is a sequence of n digits where each digit can be in the range [0, k - 1].
    // While entering a password, the last n digits entered will automatically be matched against the correct password.
    // For example, assuming the correct password is "345", if you type "012345", the box will open because the correct password matches the suffix of the entered password.
    // Return any password of minimum length that is guaranteed to open the box at some point of entering it.

    // Example 1:
    // Input: n = 1, k = 2
    // Output: "10"
    // Explanation: "01" will be accepted too.

    // Example 2:
    // Input: n = 2, k = 2
    // Output: "01100"
    // Explanation: "01100", "10011", "11001" will be accepted too.

    // Constraints:
    // 1 <= n <= 4
    // 1 <= k <= 10
    // 1 <= kn <= 4096

    func crackSafe(_ n: Int, _ k: Int) -> String {
        // n = length of the input
        // k = range of characters
        var M = Int(pow(Double(k), Double(n - 1))) // The size of the sequence/2
        var P = Array(repeating: 0, count: M * k)
        var A = Array(repeating: 0, count: M * k)
        var ans = [Character]()

        // for input n = 2, k = 4
        // Creates the array [0, 2, 4, 6, 8, 10, 12, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        //                   [0, 1, 0, 1, 0,  1,  0,  1, 0, 1, 0, 1, 0,  1,  0,  1]
            
        for i in 0..<k {// For each possible input value
                for q in 0..<M { // For each possible position that a value can have
                    P[i * M + q] = q * k + i
                    A[i * M + q] = q * k + i + 1
                }   
            }

        for i in 0..<M * k {
            var j = i
            while P[j] >= 0 {
                ans.append(Character("\(j/M)"))
                let v = P[j]
                P[j] = -1
                j = v
            }
        }

        for i in 0..<n - 1 { ans.append("0") }
        return String(ans)
    }

}