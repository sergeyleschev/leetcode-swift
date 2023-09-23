class Solution {

    // Solution by Sergey Leschev
    // 2849. Determine if a Cell Is Reachable at a Given Time

    func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        let xdiff = abs(sx - fx)
        let ydiff = abs(sy - fy)

        if xdiff == 0 && ydiff == 0 && t == 1 {
            return false
        }

        return (min(xdiff, ydiff) + abs(xdiff - ydiff)) <= t
    }
}
