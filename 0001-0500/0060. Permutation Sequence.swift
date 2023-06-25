class Solution {

    // Solution @ Sergey Leschev

    // 60. Permutation Sequence
    // The set [1, 2, 3, ..., n] contains a total of n! unique permutations.
    // By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

    // "123"
    // "132"
    // "213"
    // "231"
    // "312"
    // "321"
    // Given n and k, return the kth permutation sequence.

    // Example 1:
    // Input: n = 3, k = 3
    // Output: "213"

    // Example 2:
    // Input: n = 4, k = 9
    // Output: "2314"

    // Example 3:
    // Input: n = 3, k = 1
    // Output: "123"
     
    // Constraints:
    // 1 <= n <= 9
    // 1 <= k <= n!

    func getPermutation(_ n: Int, _ k: Int) -> String {
        var digitals: [Int] = []
        var res: String = ""
        var val = k
        var m = n

        for i in 1...n { digitals.append(i) }

        while res.count < n && val > 0 {
            let i = Int(ceil(Double(val) / Double(permutation(m - 1))))
            res += "\(digitals[i-1])"
            print(i, digitals)
            digitals.remove(at: i - 1)
            val -= (i - 1) * permutation(m - 1)
            m -= 1
        }
        return res
    }


    func permutation(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var res = 1
        for i in 1...n { res *= i }
        return res
    }
    
}