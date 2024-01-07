class Solution {

    // Solution by Sergey Leschev
    // 2968. Apply Operations to Maximize Frequency Score

    func maxFrequencyScore(_ nums: [Int], _ k: Int) -> Int {
        var sortedNums = nums.sorted()
        let n = nums.count
        var prefixSum = [Int](repeating: 0, count: n + 1)

        for i in 0..<n {
            prefixSum[i + 1] = prefixSum[i] + sortedNums[i]
        }

        var start = 0
        var end = 1
        var maxScore = 1

        while end < n {
            end += 1
            let mid = (start + end) / 2
            let target = sortedNums[mid]
            var cost =
                target * (mid - start) - (prefixSum[mid] - prefixSum[start])
                + (prefixSum[end] - prefixSum[mid] - target * (end - mid))

            while start < end && cost > k {
                start += 1
                let mid = (start + end) / 2
                let target = sortedNums[mid]
                cost =
                    target * (mid - start) - (prefixSum[mid] - prefixSum[start])
                    + (prefixSum[end] - prefixSum[mid] - target * (end - mid))
            }

            maxScore = max(maxScore, end - start)
        }

        return maxScore
    }
}
