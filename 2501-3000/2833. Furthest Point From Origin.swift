class Solution {

    // Solution by Sergey Leschev
    // 2833. Furthest Point From Origin

    func furthestDistanceFromOrigin(_ moves: String) -> Int {
        var Ls = 0
        var Rs = 0
        var Bs = 0

        for move in moves {
            if move == "L" {
                Ls += 1
            } else if move == "R" {
                Rs += 1
            } else {
                Bs += 1
            }
        }

        return abs(Ls - Rs) + Bs
    }
}
