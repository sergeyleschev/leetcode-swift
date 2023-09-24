class Solution {

    // Solution by Sergey Leschev
    // 2865. Beautiful Towers I

    func maximumSumOfHeights(_ maxHeights: [Int]) -> Int {
        let n = maxHeights.count
        var ans = 0

        for i in 0..<n {
            var sum = maxHeights[i]
            var prev = maxHeights[i]

            // Calculate sum for elements to the left of i
            for j in stride(from: i - 1, through: 0, by: -1) {
                prev = min(maxHeights[j], prev)
                sum += prev
            }

            prev = maxHeights[i]

            // Calculate sum for elements to the right of i
            for j in i + 1..<n {
                prev = min(maxHeights[j], prev)
                sum += prev
            }

            if sum > ans {
                ans = sum
            }
        }

        return ans
    }
}
