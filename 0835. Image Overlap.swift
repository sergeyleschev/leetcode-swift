class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 835. Image Overlap
    // You are given two images img1 and img2 both of size n x n, represented as binary, square matrices of the same size. (A binary matrix has only 0s and 1s as values.)
    // We translate one image however we choose (sliding it left, right, up, or down any number of units), and place it on top of the other image.  After, the overlap of this translation is the number of positions that have a 1 in both images.
    // (Note also that a translation does not include any kind of rotation.)
    // What is the largest possible overlap?

    // Example 1:
    // Input: img1 = [[1,1,0],[0,1,0],[0,1,0]], img2 = [[0,0,0],[0,1,1],[0,0,1]]
    // Output: 3
    // Explanation: We slide img1 to right by 1 unit and down by 1 unit.
    // The number of positions that have a 1 in both images is 3. (Shown in red)

    // Example 2:
    // Input: img1 = [[1]], img2 = [[1]]
    // Output: 1

    // Example 3:
    // Input: img1 = [[0]], img2 = [[0]]
    // Output: 0

    // Constraints:
    // n == img1.length
    // n == img1[i].length
    // n == img2.length
    // n == img2[i].length
    // 1 <= n <= 30
    // img1[i][j] is 0 or 1.
    // img2[i][j] is 0 or 1.

    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        var maxCount = 0
        
        for i in -A.count + 1..<A.count {
            for j in -A.count + 1..<A.count {
                maxCount = max(maxCount, matchAndCount(A, B, i, j))
            }
        }

        return maxCount
    }
    

    func matchAndCount(_ A: [[Int]], _ B: [[Int]], _ k: Int, _ l: Int) -> Int {
        var count = 0
        let dim = A.count
        
        for j in l..<dim {
            for i in k..<dim {
                if j >= 0 && j < dim && i >= 0 && i < dim && j - l >= 0 && i - k >= 0 && j-l < dim && i - k < dim {
                    count += A[j][i] & B[j-l][i-k]
                }
            }
        }
        
        return count
    }

}