class Solution {

    // 1131. Maximum of Absolute Value Expression
    // Given two arrays of integers with equal lengths, return the maximum value of:
    // |arr1[i] - arr1[j]| + |arr2[i] - arr2[j]| + |i - j|
    // where the maximum is taken over all 0 <= i, j < arr1.length.

    // Example 1:
    // Input: arr1 = [1,2,3,4], arr2 = [-1,4,5,6]
    // Output: 13

    // Example 2:
    // Input: arr1 = [1,-2,-5,0,10], arr2 = [0,-2,-1,-7,-4]
    // Output: 20

    // Constraints:
    // 2 <= arr1.length == arr2.length <= 40000
    // -10^6 <= arr1[i], arr2[i] <= 10^6

    func maxAbsValExpr(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var AMax = Int.min
        var AMin = Int.max
        var BMax = Int.min
        var BMin = Int.max
        var CMax = Int.min
        var CMin = Int.max
        var DMax = Int.min
        var DMin = Int.max
        
        for i in 0..<arr1.count {
            AMax = max(AMax, arr1[i] + arr2[i] + i)
            AMin = min(AMin, arr1[i] + arr2[i] + i)
            BMax = max(BMax, arr1[i] + arr2[i] - i)
            BMin = min(BMin, arr1[i] + arr2[i] - i)
            CMax = max(CMax, arr1[i] - arr2[i] + i)
            CMin = min(CMin, arr1[i] - arr2[i] + i)
            DMax = max(DMax, arr1[i] - arr2[i] - i)
            DMin = min(DMin, arr1[i] - arr2[i] - i)
        }

        return max(AMax - AMin, BMax - BMin, CMax - CMin, DMax - DMin)
    }

}