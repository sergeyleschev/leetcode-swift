class Solution {

    // Solution by Sergey Leschev
    // 2963. Count the Number of Good Partitions

    // Time complexity: O(N)
    // Space complexity: O(N)

    func numberOfGoodPartitions(_ nums: [Int]) -> Int {
        let m = 1_000_000_007
        var count = 0
        var last: [Int: Int] = [:]

        for i in 0..<nums.count {
            last[nums[i]] = i
        }

        var next = -1

        for i in 0..<nums.count {
            if i > next {
                count += 1
            }
            next = max(next, last[nums[i]]!)
        }

        return power(2, count - 1, m)
    }

    func power(_ b: Int, _ p: Int, _ m: Int) -> Int {
        if p <= 0 {
            return 1
        }
        let t = power(b, p / 2, m)
        return (p % 2 == 1) ? (((t * t) % m) * b) % m : (t * t) % m
    }
}
