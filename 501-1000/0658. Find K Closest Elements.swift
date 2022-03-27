class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 658. Find K Closest Elements
    // Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.
    // An integer a is closer to x than an integer b if:
    // |a - x| < |b - x|, or
    // |a - x| == |b - x| and a < b

    // Example 1:
    // Input: arr = [1,2,3,4,5], k = 4, x = 3
    // Output: [1,2,3,4]

    // Example 2:
    // Input: arr = [1,2,3,4,5], k = 4, x = -1
    // Output: [1,2,3,4]

    // Constraints:
    // 1 <= k <= arr.length
    // 1 <= arr.length <= 10^4
    // arr is sorted in ascending order.
    // -10^4 <= arr[i], x <= 10^4

    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {


        func binarySearch() -> Int {
            var l = 0
            var r = arr.count - 1

            while l + 1 < r {
                let mid = (l + r) / 2
                if arr[mid] == x {
                    return mid
                } else if arr[mid] > x {
                    r = mid
                } else {
                    l = mid
                }
            }
            return r
        }

        guard arr.count > 0 else { return [] }

        if arr[0] > x { return Array(arr[0..<min(k, arr.count)]) }
        if arr.last! < x { return Array(arr[max(arr.count - k, 0)..<arr.count]) }

        let index = binarySearch()
        var l = max(0, index - k)
        var r = min(index + k, arr.count - 1)

        while r - l != k - 1 {
            if x - arr[l] > arr[r] - x {
                l += 1
            } else {
                r -= 1
            }
        }

        return Array(arr[l...r])
    }
    
}