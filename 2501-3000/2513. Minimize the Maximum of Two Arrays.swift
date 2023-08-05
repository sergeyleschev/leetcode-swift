class Solution {

    // Solution by Sergey Leschev
    // 2513. Minimize the Maximum of Two Arrays

    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }

    func lcm(_ a: Int, _ b: Int) -> Int {
        return a / gcd(a, b) * b
    }

    func minimizeSet(_ divisor1: Int, _ divisor2: Int, _ uniqueCnt1: Int, _ uniqueCnt2: Int) -> Int
    {
        let G = lcm(divisor1, divisor2)
        var left = 0
        var right = 10_000_000_000  // 10^10

        while left < right {
            let middle = (left + right) / 2

            let x = middle - middle / divisor1 >= uniqueCnt1
            let y = middle - middle / divisor2 >= uniqueCnt2
            let z = middle - middle / G >= uniqueCnt1 + uniqueCnt2

            if x && y && z {
                right = middle
            } else {
                left = middle + 1
            }
        }

        return left
    }
}
