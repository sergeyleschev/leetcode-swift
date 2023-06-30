class Solution {

    // Solution by Sergey Leschev

    // 335. Self Crossing
    // You are given an array of integers distance.
    // You start at point (0,0) on an X-Y plane and you move distance[0] meters to the north, then distance[1] meters to the west, distance[2] meters to the south, distance[3] meters to the east, and so on. In other words, after each move, your direction changes counter-clockwise.
    // Return true if your path crosses itself, and false if it does not.

    // Example 1:
    // Input: distance = [2,1,1,2]
    // Output: true

    // Example 2:
    // Input: distance = [1,2,3,4]
    // Output: false

    // Example 3:
    // Input: distance = [1,1,1,1]
    // Output: true

    // Constraints:
    // 1 <= distance.length <= 10^5
    // 1 <= distance[i] <= 10^5

    func isSelfCrossing(_ x: [Int]) -> Bool {
        if x.count <= 3 { return false }

        let x = [0,0] + x
        var idx = 0
        while idx < x.count - 5 {
            let a = x[idx+0]
            let b = x[idx+1]
            let c = x[idx+2]
            let d = x[idx+3]
            let e = x[idx+4]
            let f = x[idx+5]

            if e < c - a && f > d {
                return true
            }

            if e >= c - a && e <= c {
                if d < b && f > d { return true }
                if d >= b && f >= d - b { return true }
            }

            idx += 1
        }

        return false
    }
    
}