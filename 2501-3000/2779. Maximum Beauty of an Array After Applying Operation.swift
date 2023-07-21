class Solution {

    // Solution by Sergey Leschev
    // 2779. Maximum Beauty of an Array After Applying Operation

    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted()
        var start = 0
        var ans = 0

        for i in 0..<sortedNums.count {
            // while window is not valid, increase the current minimum
            while sortedNums[i] - sortedNums[start] > 2 * k {
                start += 1
            }
            // the current window i.e. [start ... i] is valid, so consider it
            ans = max(ans, i - start + 1)
        }

        return ans
    }
}
