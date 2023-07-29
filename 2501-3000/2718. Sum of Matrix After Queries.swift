class Solution {

    // Solution by Sergey Leschev
    // 2718. Sum of Matrix After Queries
    // Reverse iteration
    // O(N)

    func matrixSumQueries(_ n: Int, _ queries: [[Int]]) -> Int {
        var rowFlag = Array(repeating: true, count: n)
        var colFlag = Array(repeating: true, count: n)
        var ans: Int64 = 0
        var rowRemain = n
        var colRemain = n

        for i in (0..<queries.count).reversed() {
            if queries[i][0] == 0 && rowFlag[queries[i][1]] {
                ans += Int64(colRemain) * Int64(queries[i][2])
                rowFlag[queries[i][1]] = false
                rowRemain -= 1
            }

            if queries[i][0] == 1 && colFlag[queries[i][1]] {
                ans += Int64(rowRemain) * Int64(queries[i][2])
                colFlag[queries[i][1]] = false
                colRemain -= 1
            }
        }

        return Int(ans)
    }
}
