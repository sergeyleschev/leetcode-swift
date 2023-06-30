class Solution {

    // Solution by Sergey Leschev

    // 932. Beautiful Array
    // For some fixed n, an array nums is beautiful if it is a permutation of the integers 1, 2, ..., n, such that:
    // For every i < j, there is no k with i < k < j such that nums[k] * 2 = nums[i] + nums[j].
    // Given n, return any beautiful array nums.  (It is guaranteed that one exists.)

    // Example 1:
    // Input: n = 4
    // Output: [2,1,4,3]

    // Example 2:
    // Input: n = 5
    // Output: [3,1,2,5,4]

    // Note:
    // 1 <= n <= 1000

    private var cache = [Int: [Int]]()
    

    func beautifulArray(_ N: Int) -> [Int] {
        self.cache = [Int:[Int]]()
        return form(N)
    }
    

    private func form(_ N: Int) -> [Int] {
        if (cache[N] != nil) { return cache[N]! }
        var ans = [Int](repeating: 0, count: N)
        
        if (N == 1) {
            ans[0] = 1
        } else {
            var idx = 0
            for x in form((N + 1) / 2) {
                ans[idx] = 2 * x - 1
                idx += 1
            }
            for x in form(N / 2) {
                ans[idx] = x * 2
                idx += 1
            }
        }
        
        cache[N] = ans
        return ans
    }

}