class Solution {

    // Solution by Sergey Leschev
    // 2841. Maximum Sum of Almost Unique Subarray

    // Time complexity: O(n)
    // Space complexity: O(n)

    func maxSum(_ nums: [Int], _ m: Int, _ k: Int) -> Int {
        var mp = [Int: Int]()
        var sum = 0
        var maxSum = 0
        var j = 0

        for i in 0..<k {
            sum += nums[i]
            if let count = mp[nums[i]] {
                mp[nums[i]] = count + 1
            } else {
                mp[nums[i]] = 1
            }
        }

        if mp.count >= m {
            maxSum = sum
        }

        for i in k..<nums.count {
            sum += nums[i]
            sum -= nums[j]
            if let count = mp[nums[i]] {
                mp[nums[i]] = count + 1
            } else {
                mp[nums[i]] = 1
            }
            if let count = mp[nums[j]] {
                mp[nums[j]] = count - 1
                if count - 1 == 0 {
                    mp[nums[j]] = nil
                }
            }
            if mp.count >= m {
                maxSum = max(maxSum, sum)
            }
            j += 1
        }

        return maxSum
    }
}
