class Solution {

    // Solution by Sergey Leschev
    // 2848. Points That Intersect With Cars

    func numberOfPoints(_ nums: [[Int]]) -> Int {
        var pref = Array(repeating: 0, count: 200)

        for num in nums {
            pref[num[0]] += 1
            pref[num[1] + 1] -= 1
        }

        for indx in 1..<pref.count {
            pref[indx] += pref[indx - 1]
        }

        let zeros = pref.filter { $0 == 0 }.count

        return pref.count - zeros
    }
}
