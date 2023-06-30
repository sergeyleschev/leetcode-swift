class Solution {

    // Solution by Sergey Leschev
    // 2413. Smallest Even Multiple

    func smallestEvenMultiple(_ n: Int) -> Int {
        if n % 2 == 0 {
            return n
        }
        return 2 * n
    }
}
