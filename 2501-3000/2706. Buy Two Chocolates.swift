class Solution {

    // Solution by Sergey Leschev
    // 2706. Buy Two Chocolates

    // finding smallest two element
    // O(N)

    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var s1 = Int.max
        var s2 = Int.max

        for p in prices {
            if s1 > p {
                s2 = s1
                s1 = p
            } else if s2 >= p {
                s2 = p
            }
        }

        if s1 + s2 <= money {
            return money - (s1 + s2)
        }

        return money
    }
}
