class Solution {

    // Solution by Sergey Leschev
    // 2827. Number of Beautiful Integers in the Range

    func check(_ num: Int) -> Int {
        var even = 0
        var odd = 0
        var n = num

        while n > 0 {
            if n % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }

            n /= 10
        }

        return even == odd ? 1 : 0
    }

    func numberOfBeautifulIntegers(_ low: Int, _ high: Int, _ k: Int) -> Int {
        var low = ((low - 1) / k + 1) * k
        var count = 0
        while low <= high {
            count += check(low)
            low += k

            if low >= 100_000_000 {
                return count
            }
        }

        return count
    }
}
