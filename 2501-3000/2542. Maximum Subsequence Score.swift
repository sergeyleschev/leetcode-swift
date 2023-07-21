class Solution {

    // Solution by Sergey Leschev
    // 2542. Maximum Subsequence Score

    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let a = zip(nums1, nums2).sorted(by: { $0.1 > $1.1 })
        var h = [Int](repeating: 0, count: k)
        var s = 0
        for i in 0..<k {
            h[i] = a[i].0
            s += a[i].0
        }
        var ans = s * a[k - 1].1
        for i in k..<a.count {
            let (x, y) = a[i]
            if x > h.min()! {
                s += x - h.min()!
                h[h.firstIndex(of: h.min()!)!] = x
                ans = max(ans, s * y)
            }
        }
        return ans
    }
}
