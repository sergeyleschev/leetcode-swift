class Solution {

    // Solution by Sergey Leschev
    // 2550. Count Collisions of Monkeys on a Polygon

    // Time complexity: O(logn)
    // Space complexity: O(1)

    func monkeyMove(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var res: Int64 = 1
        var base: Int64 = 2
        var n = n

        while n > 0 {
            if n % 2 == 1 {
                res = (res * base) % Int64(mod)
            }
            base = (base * base) % Int64(mod)
            n >>= 1
        }

        let finalRes = (res - 2 + Int64(mod)) % Int64(mod)
        return Int(finalRes)
    }
}
