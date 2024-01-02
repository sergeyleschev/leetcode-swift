class Solution {

    // Solution by Sergey Leschev
    // 2567. Minimum Score by Changing Two Elements

    func minimizeSum(_ nums: [Int]) -> Int {
        var s1 = Int.max
        var s2 = Int.max
        var s3 = Int.max
        var l1 = 0
        var l2 = 0
        var l3 = 0

        for n in nums {
            if s1 > n {
                s3 = s2
                s2 = s1
                s1 = n
            } else if s2 > n {
                s3 = s2
                s2 = n
            } else if s3 > n {
                s3 = n
            }

            if l1 < n {
                l3 = l2
                l2 = l1
                l1 = n
            } else if l2 < n {
                l3 = l2
                l2 = n
            } else if l3 < n {
                l3 = n
            }
        }

        return min(l1 - s3, l3 - s1, l2 - s2)
    }
}
