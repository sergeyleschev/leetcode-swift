class Solution {

    // Solution by Sergey Leschev
    // 2896. Apply Operations to Make Two Strings Equal

    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func minOperations(_ s1: String, _ s2: String, _ x: Int) -> Int {
        let n = s1.count
        var done = 0
        var inf = 1_000_000
        var one = inf
        var last = inf
        var two = inf

        for i in 0..<n {
            let index = s1.index(s1.startIndex, offsetBy: i)
            if s1[index] == s2[index] {
                last += 1
                two += 1
            } else if done < n {
                one = min(done, two + 1)
                last = min(done, two + x)
                done = inf
                two = inf
            } else {
                done = min(one + x, last + 1)
                two = one
                one = inf
                last = inf
            }
        }

        return done < inf ? done : -1
    }
}
