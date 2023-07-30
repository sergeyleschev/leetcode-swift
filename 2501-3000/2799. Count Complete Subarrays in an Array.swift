class Solution {

    // Solution by Sergey Leschev
    // 2799. Count Complete Subarrays in an Array

    func countCompleteSubarrays(_ nums: [Int]) -> Int {
        var mp = [Int: Int]()
        var all = [Int: Int]()

        for n in nums {
            all[n, default: 0] += 1
        }

        var front = 0
        var back = 0
        var ans = 0

        while front < nums.count {
            mp[nums[front], default: 0] += 1

            while back <= front && mp.count == all.count {
                if let count = mp[nums[back]] {
                    if count - 1 == 0 {
                        mp[nums[back]] = nil
                    } else {
                        mp[nums[back]] = count - 1
                    }
                }
                back += 1
                ans += (nums.count - front)
            }

            front += 1
        }

        return ans
    }
}
