class Solution {

    // Solution by Sergey Leschev

    // 875. Koko Eating Bananas
    // Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.
    // Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.
    // Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.
    // Return the minimum integer k such that she can eat all the bananas within h hours.

    // Example 1:
    // Input: piles = [3,6,7,11], h = 8
    // Output: 4

    // Example 2:
    // Input: piles = [30,11,23,4,20], h = 5
    // Output: 30

    // Example 3:
    // Input: piles = [30,11,23,4,20], h = 6
    // Output: 23

    // Constraints:
    // 1 <= piles.length <= 10^4
    // piles.length <= h <= 10^9
    // 1 <= piles[i] <= 10^9

    func minEatingSpeed(_ piles: [Int], _ H: Int) -> Int {
        guard !piles.isEmpty else { return 0 }
        var l = 1
        var r = piles.max()!
        var ans = r

        while l <= r {
            let m = (l + r) / 2
            var total = 0
            for pile in piles { total += pile % m != 0 ? pile / m + 1 : pile / m }

            if total > H {
                l = m + 1
            } else {
                r = m - 1
                ans = min(ans, m)
            }
        }

        return ans
    }

}
