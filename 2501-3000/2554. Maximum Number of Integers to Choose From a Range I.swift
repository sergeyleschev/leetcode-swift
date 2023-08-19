class Solution {

    // Solution by Sergey Leschev
    // 2554. Maximum Number of Integers to Choose From a Range I

    // Time complexity: O(N logN)
    // Space complexity: O(1)

    func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        let sortedBanned = banned.sorted()
        var ans = 0
        var j = 0
        var remainingMaxSum = maxSum

        for i in 1...n {
            if j == sortedBanned.count || i < sortedBanned[j], remainingMaxSum - i >= 0 {
                ans += 1
                remainingMaxSum -= i
            } else {
                while j < sortedBanned.count && i >= sortedBanned[j] {
                    j += 1
                }
            }
        }

        return ans
    }
}
