class Solution {

    // Solution by Sergey Leschev
    // 2845. Count of Interesting Subarrays

    // Time complexity: O(n)
    // Space complexity: O(n)

    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
        let n = nums.count
        var arr = [Int](repeating: 0, count: n + 1)
        var nm = [Int: Int]()
        arr[0] = 0
        nm[0] = 1
        var ans = 0

        for i in 0..<n {
            let curr = nums[i]
            arr[i + 1] = (arr[i] + (curr % modulo == k ? 1 : 0)) % modulo
            let val = (arr[i + 1] - k + modulo) % modulo
            ans += nm[val, default: 0]
            nm[arr[i + 1], default: 0] += 1
        }

        return ans
    }
}
