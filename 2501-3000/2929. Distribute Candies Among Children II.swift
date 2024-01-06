class Solution {

    // Solution by Sergey Leschev
    // 2929. Distribute Candies Among Children II

    func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        return Int(
            c(n + 2, 2) - 3 * c(n - limit + 1, 2) + 3 * c(n - 2 * limit, 2)
                - c(n - 3 * limit - 1, 2))
    }

    func c(_ n: Int, _ m: Int) -> Int {
        guard n >= m else { return 0 }
        return n * (n - 1) / (m * (m - 1))
    }
}
