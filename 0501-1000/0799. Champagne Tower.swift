class Solution {

    // Solution by Sergey Leschev

    // 799. Champagne Tower
    // We stack glasses in a pyramid, where the first row has 1 glass, the second row has 2 glasses, and so on until the 100th row.  Each glass holds one cup of champagne.
    // Then, some champagne is poured into the first glass at the top.  When the topmost glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has its excess champagne fall on the floor.)
    // For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, as pictured below.
    // Now after pouring some non-negative integer cups of champagne, return how full the jth glass in the ith row is (both i and j are 0-indexed.)

    // Finds how full the j-th glass in the i-th row is.

    // - Parameters:
    //   - poured: The number of poured glasses.
    //   - query_row: Query row.
    //   - query_glass: Query glass.
    // - Returns: How full the j-th glass in the i-th row is.

    // Example 1:
    // Input: poured = 1, query_row = 1, query_glass = 1
    // Output: 0.00000
    // Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.

    // Example 2:
    // Input: poured = 2, query_row = 1, query_glass = 1
    // Output: 0.50000
    // Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.

    // Example 3:
    // Input: poured = 100000009, query_row = 33, query_glass = 17
    // Output: 1.00000

    // Constraints:
    // 0 <= poured <= 10^9
    // 0 <= query_glass <= query_row < 100

    // - Complexity:
    //   - time: O(n^2), where n is the number of rows.
    //   - space: O(n^2), where n is the number of rows.

    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var dp = [[Double]](repeating: [Double](repeating: 0.0, count: 102), count: 102)

        dp[0][0] = Double(poured)

        for row in 0...query_row {
            for col in 0...row {
                var q = (dp[row][col] - 1) / 2
                guard q > 0 else { continue }
                dp[row + 1][col] += q
                dp[row + 1][col + 1] += q
            }
        }

        return min(1, dp[query_row][query_glass])
    }

}
