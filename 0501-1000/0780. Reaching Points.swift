class Solution {

    // Solution @ Sergey Leschev

    // 780. Reaching Points
    // Given four integers sx, sy, tx, and ty, return true if it is possible to convert the point (sx, sy) to the point (tx, ty) through some operations, or false otherwise.
    // The allowed operation on some point (x, y) is to convert it to either (x, x + y) or (x + y, y).

    // Example 1:
    // Input: sx = 1, sy = 1, tx = 3, ty = 5
    // Output: true
    // Explanation:
    // One series of moves that transforms the starting point to the target is:
    // (1, 1) -> (1, 2)
    // (1, 2) -> (3, 2)
    // (3, 2) -> (3, 5)

    // Example 2:
    // Input: sx = 1, sy = 1, tx = 2, ty = 2
    // Output: false

    // Example 3:
    // Input: sx = 1, sy = 1, tx = 1, ty = 1
    // Output: true

    // Constraints:
    // 1 <= sx, sy, tx, ty <= 10^9

    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {  moduleBackTracing(sx, sy, tx, ty) }
    
    
    func recursive(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        if (sx != tx || sy != ty) && (sx > tx || sy > ty) { return false }
        if sx == tx && sy == ty { return true }
        return reachingPoints(sx + sy, sy, tx, ty) || reachingPoints(sx, sx + sy, tx, ty)
    }
    
    
    func backTracing(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx, ty = ty
        
        while sx <= tx && sy <= ty {
            if sx == tx && sy == ty { return true }
            if tx > ty {
                tx -= ty
            } else if ty > tx {
                ty -= tx
            } else { break }
        }

        return false
    }
    
    
    func moduleBackTracing(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx, ty = ty
        
        while (tx >= sx && ty >= sy) {
            if tx == ty { break }
            if tx > ty {
                if ty > sy { tx %= ty }
                else { return (tx - sx) % ty == 0 }

            } else {
                if tx > sx { ty %= tx }
                else { return (ty - sy) % tx == 0 }
            }
        }

        return (tx == sx && ty == sy);
    }
    
}