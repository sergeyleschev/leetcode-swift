class Solution {

    // 593. Valid Square
    // Given the coordinates of four points in 2D space p1, p2, p3 and p4, return true if the four points construct a square.
    // The coordinate of a point pi is represented as [xi, yi]. The input is not given in any order.
    // A valid square has four equal sides with positive length and four equal angles (90-degree angles).

    // Finds if the four points could construct a square.

    // - Parameters:
    //   - p1: First point.
    //   - p2: Second point.
    //   - p3: Third point.
    //   - p4: Fourth point.
    // - Returns: True if the four points could construct a square, otherwise returns false.

    // Example 1:
    // Input: p1 = [0,0], p2 = [1,1], p3 = [1,0], p4 = [0,1]
    // Output: true

    // Example 2:
    // Input: p1 = [0,0], p2 = [1,1], p3 = [1,0], p4 = [0,12]
    // Output: false

    // Example 3:
    // Input: p1 = [1,0], p2 = [-1,0], p3 = [0,1], p4 = [0,-1]
    // Output: true

    // Constraints:
    // p1.length == p2.length == p3.length == p4.length == 2
    // -10^4 <= xi, yi <= 10^4

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        var arr = [(p1[0], p1[1]), (p2[0], p2[1]), (p3[0], p3[1]), (p4[0], p4[1])]
        var length = Set<Int>()
        
        for i in 0..<arr.count {
            for j in i + 1..<arr.count {
                let x = abs(arr[i].0 - arr[j].0)
                let y = abs(arr[i].1 - arr[j].1)
                length.insert(x * x + y * y)
            }
        }

        if length.count != 2 { return false } 
        else {
            let first = length.removeFirst()
            let second = length.removeFirst()
            if first > second { return first == second * 2 } else { return second == first * 2 }
        }
    }

}