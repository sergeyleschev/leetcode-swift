class Solution {

    // Solution by Sergey Leschev
    // 2972. Count the Number of Incremovable Subarrays II

    // Two pointer
    // O(N)

    func countSortedArrays(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let n1 = arr1.count
        let n2 = arr2.count

        var result = 0
        var i = 0
        var j = 0

        while i < n1 && j < n2 {
            if arr1[i] < arr2[j] {
                result += (n2 - j)
                i += 1
            } else {
                j += 1
            }
        }

        return result
    }

    func incremovableSubarrayCount(_ nums: [Int]) -> Int {
        let n = nums.count

        if n == 1 {
            return 1
        }

        var i = 0
        var j = n - 1
        var arr1: [Int] = []
        var arr2: [Int] = []

        while (i + 1) < n && nums[i] < nums[i + 1] {
            arr1.append(nums[i])
            i += 1
        }
        arr1.append(nums[i])

        while (j - 1) >= 0 && nums[j] > nums[j - 1] {
            arr2.append(nums[j])
            j -= 1
        }
        arr2.append(nums[j])
        arr2.reverse()

        if j < i {
            let ans = n * (n + 1) / 2
            return ans
        }

        var ans = 0
        ans += arr1.count  // 1
        ans += arr2.count  // 2
        ans += countSortedArrays(arr1, arr2)  // 3
        ans += 1  // 4

        return ans
    }
}
