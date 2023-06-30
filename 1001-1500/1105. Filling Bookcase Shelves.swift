class Solution {

    // Solution by Sergey Leschev

    // 1105. Filling Bookcase Shelves
    // We have a sequence of books: the i-th book has thickness books[i][0] and height books[i][1].
    // We want to place these books in order onto bookcase shelves that have total width shelf_width.
    // We choose some of the books to place on this shelf (such that the sum of their thickness is <= shelf_width), then build another level of shelf of the bookcase so that the total height of the bookcase has increased by the maximum height of the books we just put down.  We repeat this process until there are no more books to place.
    // Note again that at each step of the above process, the order of the books we place is the same order as the given sequence of books.  For example, if we have an ordered list of 5 books, we might place the first and second book onto the first shelf, the third book on the second shelf, and the fourth and fifth book on the last shelf.
    // Return the minimum possible height that the total bookshelf can be after placing shelves in this manner.

    // Example 1:
    // Input: books = [[1,1],[2,3],[2,3],[1,1],[1,1],[1,1],[1,2]], shelf_width = 4
    // Output: 6
    // Explanation:
    // The sum of the heights of the 3 shelves are 1 + 3 + 2 = 6.
    // Notice that book number 2 does not have to be on the first shelf.

    // Constraints:
    // 1 <= books.length <= 1000
    // 1 <= books[i][0] <= shelf_width <= 1000
    // 1 <= books[i][1] <= 1000

    func minHeightShelves(_ books: [[Int]], _ shelf_width: Int) -> Int {
        var dp = [Int](repeating: 0, count: books.count + 1)
        
        for i in 1...books.count {
            var width = books[i - 1][0]
            var height = books[i - 1][1]
            dp[i] = dp[i - 1] + height
            var j = i - 1
            
            while j > 0 && width + books[j - 1][0] <= shelf_width {
                height = max(height, books[j - 1][1])
                width += books[j - 1][0]
                dp[i] = min(dp[i], dp[j - 1] + height)
                j -= 1
            }
        }
        
        return dp[books.count]
    }

}