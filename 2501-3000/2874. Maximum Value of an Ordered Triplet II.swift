class Solution {

    // Solution by Sergey Leschev
    // 2874. Maximum Value of an Ordered Triplet II

    // For every element 'a' in the array 'A', we keep track of three values:
    // 'res' represents the maximum value of a triplet (A[i] - A[j]) * A[k].
    // 'maxab' is the maximum value of the pair A[i] - A[j].
    // 'maxa' is the maximum value among all elements in the array A[i].
    // We continuously update these values as we iterate through the array to find the maximum triplet value.

    // Time complexity: O(n)
    // Space complexity: O(1)

    func maximumTripletValue(_ nums: [Int]) -> Int {
        var res: Int64 = 0
        var maxa: Int64 = 0
        var maxab: Int64 = 0

        for a in nums {
            res = max(res, maxab * Int64(a))
            maxab = max(maxab, maxa - Int64(a))
            maxa = max(maxa, Int64(a))
        }

        return Int(res)
    }
}
