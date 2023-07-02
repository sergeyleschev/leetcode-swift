class Solution {

    // Solution by Sergey Leschev
    // 2543. Check if Point Is Reachable

    func isReachable(_ targetX: Int, _ targetY: Int) -> Bool {
        var x = decrease(targetX)
        var y = decrease(targetY)

        while true {
            if x == 1 || y == 1 {
                return true
            }

            if x == y {
                return false  // The coordinates won't change, we are stuck
            }

            let newCoordinate = decrease(x + y)

            // Putting the new coordinate to the place of the biggest current coordinate
            if x < y {
                y = newCoordinate
            } else {
                x = newCoordinate
            }
        }
    }

    func decrease(_ value: Int) -> Int {
        var result = value
        while result % 2 == 0 {
            result = result >> 1  // This means division by 2
        }
        return result
    }
}
