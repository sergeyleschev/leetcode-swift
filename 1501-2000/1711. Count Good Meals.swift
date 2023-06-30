class Solution {

    // Solution by Sergey Leschev

    // 1711. Count Good Meals
    // A good meal is a meal that contains exactly two different food items with a sum of deliciousness equal to a power of two.
    // You can pick any two different foods to make a good meal.
    // Given an array of integers deliciousness where deliciousness[i] is the deliciousness of the i th item of food, return the number of different good meals you can make from this list modulo 10^9 + 7.
    // Note that items with different indices are considered different even if they have the same deliciousness value.

    // Example 1:
    // Input: deliciousness = [1,3,5,7,9]
    // Output: 4
    // Explanation: The good meals are (1,3), (1,7), (3,5) and, (7,9).
    // Their respective sums are 4, 8, 8, and 16, all of which are powers of 2.

    // Example 2:
    // Input: deliciousness = [1,1,1,3,3,3,7]
    // Output: 15
    // Explanation: The good meals are (1,1) with 3 ways, (1,3) with 9 ways, and (1,7) with 3 ways.

    // Constraints:
    // 1 <= deliciousness.length <= 10^5
    // 0 <= deliciousness[i] <= 220

    private struct Pair: Hashable {
        var small:Int
        var big: Int
    }

    private let mod = 1_000_000_007
    

    func countPairs(_ deliciousness: [Int]) -> Int {
        var ans = 0
        var counter = [Int:Int]()
        deliciousness.forEach { counter[$0,default: 0 ] += 1 }
        let sortedCounter = counter.sorted { $0.key < $1.key }
        let targetDeciliousSum = (0...22).map { 1 << $0 }
        var visited = Set<Pair>()

        for (d1,cnt) in sortedCounter {
            for sum in targetDeciliousSum {
                let d2 = sum - d1
                if let cnt2 = counter[d2] {
                    let k = Pair(small: min(d1, d2), big: max(d1, d2))
                    guard !visited.contains(k) else { continue }
                    visited.insert(k)
                    if d1 == d2 {
                        ans = (ans + cnt * (cnt - 1) / 2) % mod
                    } else {
                        ans = (ans + cnt * cnt2) % mod
                    }
                }
            }
        }
        return ans % mod
    }

}