class Solution {

    // Solution by Sergey Leschev
    // 2657. Find the Prefix Common Array of Two Arrays
    // Time complexity: O(n)
    // Space complexity: O(n)

    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        let n = A.count
        var aux = [Int](repeating: 0, count: n + 1)
        var ans = [Int](repeating: 0, count: n)
        var cmn = 0

        for i in 0..<n {
            aux[A[i]] += 1
            if aux[A[i]] == 2 {
                cmn += 1
            }
            aux[B[i]] += 1
            if aux[B[i]] == 2 {
                cmn += 1
            }
            ans[i] = cmn
        }

        return ans
    }
}
