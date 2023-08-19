class Solution {

    // Solution by Sergey Leschev
    // 2545. Sort the Students by Their Kth Score

    // Time complexity: O(quick sort)
    // Space complexity: O(quick sort)

    func sortTheStudents(_ score: [[Int]], _ k: Int) -> [[Int]] {
        var sortedScore = score
        sortedScore.sort(by: { $0[k] > $1[k] })
        return sortedScore
    }
}
