class Solution {

    // Solution by Sergey Leschev
    // 2928. Distribute Candies Among Children I

    func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        var count = 0

        for i in 0...(min(n, limit)) {
            for j in 0...(min(n - i, limit)) {
                let k = n - i - j
                if k >= 0 && k <= limit {
                    count += 1
                }
            }
        }

        return count
    }
}
