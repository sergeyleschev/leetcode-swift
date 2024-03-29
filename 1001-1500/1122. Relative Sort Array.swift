class Solution {

    // Solution by Sergey Leschev

    // 1122. Relative Sort Array
    // Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.
    // Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

    // Example 1:
    // Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
    // Output: [2,2,2,1,4,3,3,9,6,7,19]

    // Constraints:
    // 1 <= arr1.length, arr2.length <= 1000
    // 0 <= arr1[i], arr2[i] <= 1000
    // All the elements of arr2 are distinct.
    // Each arr2[i] is in arr1.

    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var cache: [Int: [Int]] = [:]
        var ans = [Int]()
        for num in arr2 { cache[num] = [] }

        for num in arr1 {
            if cache[num] != nil {
                cache[num]!.append(num)
            } else {
                ans.append(num)
            }
        }

        ans.sort(by: <)

        for i in stride(from: arr2.count - 1, to: -1, by: -1) {
            ans.insert(contentsOf: cache[arr2[i]]!, at: 0)
        }
        return ans
    }

}
