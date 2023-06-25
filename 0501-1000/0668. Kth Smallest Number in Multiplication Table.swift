class Solution {

    // Solution @ Sergey Leschev

    // 668. Kth Smallest Number in Multiplication Table
    // Nearly everyone has used the Multiplication Table. The multiplication table of size m x n is an integer matrix mat where mat[i][j] == i * j (1-indexed).
    // Given three integers m, n, and k, return the kth smallest element in the m x n multiplication table.

    // Example 1:
    // Input: m = 3, n = 3, k = 5
    // Output: 3
    // Explanation: The 5th smallest number is 3.

    // Example 2:
    // Input: m = 2, n = 3, k = 6
    // Output: 6
    // Explanation: The 6th smallest number is 6.

    // Constraints:
    // 1 <= m, n <= 3 * 10^4
    // 1 <= k <= m * n

    // Multiplication Table
    // 1  2  3  4  5  6
    // 2  4  6  8 10 12
    // 3  6  9 12 15 18
    // 4  8 12 16 20 24
    
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var low = 1
        var high = m * n

        while low < high {
            let mid = (low + high) / 2
            if beyondKth(mid, m, n, k) { high = mid }
            else { low = mid + 1 }
        }
        
        return low
    }
    

    private func beyondKth(_ num: Int, _ m: Int, _ n: Int, _ k: Int) -> Bool {
        var count = 0
        for i in 1...m { count += min(num / i, n) }
        return count >= k
    }
    
}