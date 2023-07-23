class Solution {

    // Solution by Sergey Leschev
    // 2731. Movement of Robots
    // O(N logN)

    func sumDistance(_ nums: [Int], _ s: String, _ d: Int) -> Int {
        let MOD = 1_000_000_007
        var sortedNums = nums
        var sIndex = s.startIndex

        for i in 0..<nums.count {
            if s[sIndex] == "R" {
                sortedNums[i] += d
            } else {
                sortedNums[i] -= d
            }
            sIndex = s.index(after: sIndex)
        }

        sortedNums.sort()
        var ans = 0
        var pref: Int64 = 0  // Use Int64 to handle larger values

        for i in 0..<sortedNums.count {
            let num = Int64(sortedNums[i])
            ans += Int((Int64(i) * num - pref) % Int64(MOD))
            ans %= MOD
            pref += num
        }

        return ans
    }
}
