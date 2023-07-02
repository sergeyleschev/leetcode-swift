class Solution {

    // Solution by Sergey Leschev

    // 832. Flipping an Image
    // Given an n x n binary matrix image, flip the image horizontally, then invert it, and return the resulting image.
    // To flip an image horizontally means that each row of the image is reversed.
    // For example, flipping [1,1,0] horizontally results in [0,1,1].
    // To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0.
    // For example, inverting [0,1,1] results in [1,0,0].

    // Flips the image horizontally, then inverts it.

    // - Parameter A: A binary matrix.
    // - Returns: The resulting image.

    // Example 1:
    // Input: image = [[1,1,0],[1,0,1],[0,0,0]]
    // Output: [[1,0,0],[0,1,0],[1,1,1]]
    // Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
    // Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]

    // Example 2:
    // Input: image = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
    // Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
    // Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
    // Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]

    // Constraints:
    // n == image.length
    // n == image[i].length
    // 1 <= n <= 20
    // images[i][j] is either 0 or 1.

    // - Complexity:
    //   - time: O(n), where n is the number of elements in A.
    //   - space: O(n), where n is the number of elements in A.

    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var ans = A

        for i in 0..<ans.count {
            for j in 0..<(ans[i].count + 1) / 2 {
                let tmp = ans[i][j] ^ 1
                ans[i][j] = ans[i][ans[i].count - j - 1] ^ 1
                ans[i][ans[i].count - j - 1] = tmp
            }
        }

        return ans
    }

}
