/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */
class Solution {

    // Solution by Sergey Leschev

    // 1095. Find in Mountain Array
    // (This problem is an interactive problem.)
    // You may recall that an array A is a mountain array if and only if:
    // A.length >= 3
    // There exists some i with 0 < i < A.length - 1 such that:
    // A[0] < A[1] < ... A[i-1] < A[i]
    // A[i] > A[i+1] > ... > A[A.length - 1]
    // Given a mountain array mountainArr, return the minimum index such that mountainArr.get(index) == target.  If such an index doesn't exist, return -1.
    // You can't access the mountain array directly.  You may only access the array using a MountainArray interface:
    // MountainArray.get(k) returns the element of the array at index k (0-indexed).
    // MountainArray.length() returns the length of the array.
    // Submissions making more than 100 calls to MountainArray.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

    // Example 1:
    // Input: array = [1,2,3,4,5,3,1], target = 3
    // Output: 2
    // Explanation: 3 exists in the array, at index=2 and index=5. Return the minimum index, which is 2.

    // Example 2:
    // Input: array = [0,1,2,4,2,1], target = 3
    // Output: -1
    // Explanation: 3 does not exist in the array, so we return -1.

    // Constraints:
    // 3 <= mountain_arr.length() <= 10000
    // 0 <= target <= 10^9
    // 0 <= mountain_arr.get(index) <= 10^9

    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let length = mountainArr.length()
        let peakIndex = peakIndexOfMountain(mountainArr, 0, length - 1)
        
        if target > mountainArr.get(peakIndex) {return -1}

        let left = findInSortedArray(target, mountainArr, 0, peakIndex, true)
        if left != -1 { return left }

        let right = findInSortedArray(target, mountainArr, peakIndex+1, length - 1, false)
        return right
    }

    
    func peakIndexOfMountain(_ mountainArr: MountainArray, _ left: Int, _ right: Int) -> Int {
        while right - left >= 2 {
            let mid = left + (right - left) / 2
            
            if mountainArr.get(mid) > mountainArr.get(mid - 1) &&
               mountainArr.get(mid) < mountainArr.get(mid + 1) {
                return peakIndexOfMountain(mountainArr, mid + 1, right)
            } else if mountainArr.get(mid) < mountainArr.get(mid - 1) &&
                mountainArr.get(mid) > mountainArr.get(mid + 1) {
                return peakIndexOfMountain(mountainArr, left, mid - 1)
            } else {
                return mid
            }
        }
        
        if mountainArr.get(left) < mountainArr.get(right) { return right }
        return left
    }
    

    func findInSortedArray(_ target: Int, _ mountainArr: MountainArray, _ left: Int, _ right: Int, _ ascending: Bool) -> Int {
        while right - left >= 2 {
            let mid = left + (right - left) / 2
            
            if shouldMoveToLeft(target, mountainArr, mid, ascending) {
                return findInSortedArray(target, mountainArr, left, mid - 1, ascending)
            } else {
                return findInSortedArray(target, mountainArr, mid, right, ascending)
            }
        }
        
        if right - left == 1 {
            if (mountainArr.get(left) == target) {
                return left
            } else if (mountainArr.get(right) == target) {
                return right
            } else {
                return -1
            }
        }
        
        return (mountainArr.get(left) == target) ? left : -1
    }
    

    func shouldMoveToLeft(_ target: Int, _ mountainArr: MountainArray, _ mid: Int, _ ascending: Bool) -> Bool {
        if ascending {
            return mountainArr.get(mid) > target
        } else {
            return mountainArr.get(mid) < target
        }
    }

}