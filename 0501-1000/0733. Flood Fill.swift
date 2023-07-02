class Solution {

    // Solution by Sergey Leschev

    // 733. Flood Fill
    // An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
    // You are also given three integers sr, sc, and newColor. You should perform a flood fill on the image starting from the pixel image[sr][sc].
    // To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with newColor.
    // Return the modified image after performing the flood fill.

    // Replaces the old color in the image with the new color.

    // - Parameters:
    //   - image: 2-D array of integers.
    //   - sr: Starting row.
    //   - sc: Starting column.
    //   - newColor: New color.
    // - Returns: Modified image.

    // Example 1:
    // Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
    // Output: [[2,2,2],[2,2,0],[2,0,1]]
    // Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
    // Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

    // Example 2:
    // Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, newColor = 2
    // Output: [[2,2,2],[2,2,2]]

    // Constraints:
    // m == image.length
    // n == image[i].length
    // 1 <= m, n <= 50
    // 0 <= image[i][j], newColor < 2^16
    // 0 <= sr < m
    // 0 <= sc < n

    // - Complexity:
    //   - time: O(n), where n is the number of pixels in the image.
    //   - space: O(n), where n is the number of pixels in the image.

    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        guard image[sr][sc] != newColor else { return image }
        var image = image

        dfs(&image, row: sr, col: sc, newColor: newColor, oldColor: image[sr][sc])
        return image
    }

    private func dfs(_ image: inout [[Int]], row: Int, col: Int, newColor: Int, oldColor: Int) {
        image[row][col] = newColor

        if row + 1 < image.count, image[row + 1][col] == oldColor {
            dfs(&image, row: row + 1, col: col, newColor: newColor, oldColor: oldColor)
        }

        if row - 1 >= 0, image[row - 1][col] == oldColor {
            dfs(&image, row: row - 1, col: col, newColor: newColor, oldColor: oldColor)
        }

        if col + 1 < image[row].count, image[row][col + 1] == oldColor {
            dfs(&image, row: row, col: col + 1, newColor: newColor, oldColor: oldColor)
        }

        if col - 1 >= 0, image[row][col - 1] == oldColor {
            dfs(&image, row: row, col: col - 1, newColor: newColor, oldColor: oldColor)
        }
    }

}
