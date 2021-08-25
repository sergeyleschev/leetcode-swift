class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 497. Random Point in Non-overlapping Rectangles
    // Given a list of non-overlapping axis-aligned rectangles rects, write a function pick which randomly and uniformily picks an integer point in the space covered by the rectangles.
    // Note:
    // An integer point is a point that has integer coordinates. 
    // A point on the perimeter of a rectangle is included in the space covered by the rectangles. 
    // ith rectangle = rects[i] = [x1,y1,x2,y2], where [x1, y1] are the integer coordinates of the bottom-left corner, and [x2, y2] are the integer coordinates of the top-right corner.
    // length and width of each rectangle does not exceed 2000.
    // 1 <= rects.length <= 100
    // pick return a point as an array of integer coordinates [p_x, p_y]
    // pick is called at most 10000 times.

    // Example 1:
    // Input: 
    // ["Solution","pick","pick","pick"]
    // [[[[1,1,5,5]]],[],[],[]]
    // Output: 
    // [null,[4,1],[4,1],[3,3]]

    // Example 2:
    // Input: 
    // ["Solution","pick","pick","pick","pick","pick"]
    // [[[[-2,-2,-1,-1],[1,0,3,0]]],[],[],[],[],[]]
    // Output: 
    // [null,[-1,-2],[2,0],[-2,-1],[3,0],[-2,-2]]
    // Explanation of Input Syntax:
    // The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array of rectangles rects. pick has no arguments. Arguments are always wrapped with a list, even if there aren't any.

    // Initialization of data structures.
    // - Parameter rects: A list of non-overlapping axis-aligned rectangles.

    // - Complexity:
    //   - time: O(n), where n is the length of *rects*.
    //   - space: O(n), where n is the length of *rects*.

    private let rects: [[Int]]
    private var psum: [Int]
    private var total: Int

    
    init(_ rects: [[Int]]) {
        self.rects = rects
        psum = [Int]()
        total = 0

        for rect in rects {
            total += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            psum.append(total)
        }
    }


    // Randomly and uniformly picks an integer point in the space covered by the rectangles.
    // - Returns: Integer point in the space covered by the rectangles.

    // - Complexity:
    //   - time: O(log(n)), where n is the length of *rects*.
    //   - space: O(1), only constant space is used.
    
    func pick() -> [Int] {
        let target = Int.random(in: 0..<total)

        var start = 0
        var end = rects.count - 1

        while start != end {
            let mid = start + (end - start) / 2

            if target >= psum[mid] {
                start = mid + 1
            } else {
                end = mid
            }
        }

        let rect = rects[start]
        let width = rect[2] - rect[0] + 1
        let height = rect[3] - rect[1] + 1
        let base = psum[start] - width * height

        return [rect[0] + (target - base) % width, rect[1] + (target - base) / width]
    }

}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(rects)
 * let ret_1: [Int] = obj.pick()
 */