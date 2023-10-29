class Solution {

    // Solution by Sergey Leschev
    // 2916. Subarrays Distinct Element Sum of Squares II

    // This code utilizes a segment tree with lazy propagation to efficiently manage updates and queries over a range of elements.

    // The "build" function constructs the segment tree by recursively dividing the array
    // into segments and computes the sum of elements within each segment.

    // For updates, the "update" function employs lazy propagation to efficiently modify the segment tree.
    // It updates both the sum and the sum of squares for each segment.

    // The core logic of determining the sum of counts is encapsulated in the "sumCounts" function.
    // It iterates through the input array in reverse order,
    // adjusting the segment tree based on the most recent index of each number.

    // The variable "ans" accumulates the result as we traverse the array.

    // Time complexity: O(n * log n)
    // Space complexity: O(n)

    func sumCounts(_ nums: [Int]) -> Int {
        let N = 100005
        let mod = 1_000_000_007

        var a = [Int](repeating: 0, count: N)
        var seg = [Int](repeating: 0, count: 4 * N)
        var segsq = [Int](repeating: 0, count: 4 * N)
        var lazy = [Int](repeating: 0, count: 4 * N)

        // Build the segment tree.
        func build(_ node: Int, _ start: Int, _ end: Int) {
            if start == end {
                seg[node] = a[start]
                segsq[node] = (a[start] * a[start]) % mod
                return
            }
            let mid = (start + end) >> 1
            build(node << 1, start, mid)
            build(node << 1 | 1, mid + 1, end)
            seg[node] = (seg[node << 1] + seg[node << 1 | 1]) % mod
            segsq[node] = (segsq[node << 1] + segsq[node << 1 | 1]) % mod
        }

        // Update the segment tree and handle lazy propagation.
        func update(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int, _ val: Int) {
            if lazy[node] != 0 {
                segsq[node] +=
                    ((end - start + 1) * (lazy[node] * lazy[node]) % mod) % mod
                    + (2 * lazy[node] * seg[node]) % mod
                segsq[node] %= mod
                seg[node] += ((end - start + 1) * lazy[node]) % mod
                seg[node] %= mod
                if start != end {
                    lazy[node << 1] += lazy[node]
                    lazy[node << 1 | 1] += lazy[node]
                }
                lazy[node] = 0
            }
            if start > end || start > r || end < l {
                return
            }
            if l <= start && end <= r {
                segsq[node] +=
                    ((end - start + 1) * (val * val) % mod) % mod + (2 * val * seg[node]) % mod
                segsq[node] %= mod
                seg[node] += ((end - start + 1) * val) % mod
                seg[node] %= mod
                if start != end {
                    lazy[node << 1] += val
                    lazy[node << 1 | 1] += val
                }
                return
            }
            let mid = (start + end) >> 1
            update(node << 1, start, mid, l, r, val)
            update(node << 1 | 1, mid + 1, end, l, r, val)
            seg[node] = (seg[node << 1] + seg[node << 1 | 1]) % mod
            segsq[node] = (segsq[node << 1] + segsq[node << 1 | 1]) % mod
        }

        // Main function to find the sum of counts.
        let n = nums.count

        // Build the 'a' array with 0 values.
        for i in 1...n {
            a[i] = 0
        }

        // Build the segment tree.
        build(1, 1, n)

        // Use a dictionary to store the last seen index of each number.
        var prevSeenAt = [Int: Int]()

        var ans = 0

        for i in stride(from: n - 1, through: 0, by: -1) {
            if prevSeenAt[nums[i]] == nil {
                update(1, 1, n, i + 1, n, 1)
            } else {
                if let prevIndex = prevSeenAt[nums[i]] {
                    update(1, 1, n, i + 1, prevIndex - 1, 1)
                }
            }

            prevSeenAt[nums[i]] = i + 1

            ans = (ans + segsq[1]) % mod
        }

        return ans
    }
}
