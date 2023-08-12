class Solution {

    // Solution by Sergey Leschev
    // 2813. Maximum Elegance of a K-Length Subsequence

    // # Intuition
    // The approach involves sorting the "items" array in descending order based on the "profiti". By selecting the first "k" items, we ensure that we attain the highest possible "total_profit".

    // # Approach
    // Upon the selection of the initial "k" items, attention turns to the remaining "n - k" items. The viability of adding these items depends on whether they belong to an unexplored category (not yet in the "seen" set).
    // Given the restriction of maintaining a subsequence size of "k", a pivotal decision arises. To optimize the elegance metric, the algorithm strategically replaces an existing item with the lowest profit when that item shares its category with another.
    // This iterative refinement process continually adjusts the subsequence while upholding the imperative of category distinctiveness.
    // The final output of the function encapsulates the pinnacle of elegance attained through this intricate process—a union of the cumulative impact of total profit and the singularity of categories.

    // Time complexity: O(nlogn)
    // Space complexity: O(n)

    func findMaximumElegance(_ items: [[Int]], _ k: Int) -> Int {
        var items = items.sorted(by: { $0[0] > $1[0] })
        var res: Int64 = 0
        var cur: Int64 = 0
        var dup = [Int]()
        var seen = Set<Int>()

        for i in 0..<items.count {
            if i < k {
                if seen.contains(items[i][1]) {
                    dup.append(items[i][0])
                }
                cur += Int64(items[i][0])
            } else if !seen.contains(items[i][1]) {
                if dup.isEmpty {
                    break
                }
                cur += Int64(items[i][0] - dup.removeLast())
            }
            seen.insert(items[i][1])
            res = max(res, cur + Int64(seen.count) * Int64(seen.count))
        }

        return Int(res)
    }
}
