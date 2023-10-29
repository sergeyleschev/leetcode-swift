class Solution {

    // Solution by Sergey Leschev
    // 2873. Maximum Value of an Ordered Triplet I

    // For each element 'a' in the array 'A', we compute and update the following values:
    // 'res' represents the maximum value of a triplet (A[i] - A[j]) * A[k].
    // 'maxab' represents the maximum difference between pairs of elements A[i] - A[j].
    // 'maxa' represents the maximum element value among A[i].

    // Time complexity: O(n)
    // Space complexity: O(1)

    func maximumTripletValue(_ nums: [Int]) -> Int {
        var res = 0
        var maxa = 0
        var maxab = 0

        for a in nums {
            res = max(res, maxab * a)
            maxab = max(maxab, maxa - a)
            maxa = max(maxa, a)
        }

        return res
    }
}
