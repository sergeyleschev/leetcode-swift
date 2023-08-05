class Solution {

    // Solution by Sergey Leschev
    // 2517. Maximum Tastiness of Candy Basket

    // Time complexity: O(n log(10^9))
    // Space complexity: O(sort)

    func maximumTastiness(_ price: [Int], _ k: Int) -> Int {
        var price = price.sorted()

        func check(_ x: Int) -> Bool {
            var last = price[0]
            var count = 1
            var i = 1

            while count < k && i < price.count {
                if price[i] - last >= x {
                    last = price[i]
                    count += 1
                }
                i += 1
            }
            return count == k
        }

        var lo = 0
        var hi = 1_000_000_000

        while lo < hi {
            let mid = (lo + hi) / 2
            if check(mid) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo - 1
    }
}
