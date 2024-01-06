class Solution {

    // Solution by Sergey Leschev
    // 2946. Matrix Similarity After Cyclic Shifts

    // Time complexity: O (m * n)
    // Space complexity: O(1)

    func areSimilar(_ mat: [[Int]], _ k: Int) -> Bool {
        for row in mat {
            let n = row.count
            for i in 0..<n {
                if row[i] != row[(i + k) % n] {
                    return false
                }
            }
        }
        return true
    }
}
