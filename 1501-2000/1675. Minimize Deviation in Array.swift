class Solution {

    // Solution by Sergey Leschev

    // 1675. Minimize Deviation in Array
    // You are given an array nums of n positive integers.
    // You can perform two types of operations on any element of the array any number of times:
    // If the element is even, divide it by 2.
    // For example, if the array is [1,2,3,4], then you can do this operation on the last element, and the array will be [1,2,3,2].
    // If the element is odd, multiply it by 2.
    // For example, if the array is [1,2,3,4], then you can do this operation on the first element, and the array will be [2,2,3,4].
    // The deviation of the array is the maximum difference between any two elements in the array.

    // Return the minimum deviation the array can have after performing some number of operations.

    // Example 1:
    // Input: nums = [1,2,3,4]
    // Output: 1
    // Explanation: You can transform the array to [1,2,3,2], then to [2,2,3,2], then the deviation will be 3 - 2 = 1.

    // Example 2:
    // Input: nums = [4,1,5,20,3]
    // Output: 3
    // Explanation: You can transform the array after two operations to [4,2,5,5,3], then the deviation will be 5 - 2 = 3.

    // Example 3:
    // Input: nums = [2,10,8]
    // Output: 3

    // Constraints:
    // n == nums.length
    // 2 <= n <= 10^5
    // 1 <= nums[i] <= 10^9

    func minimumDeviation(_ nums: [Int]) -> Int {
        var maxOdd = 0
        var dev: [(Int, Int)] = []
        var cur = 0

        for i in nums {
            var j = i
            while j % 2 == 0 { j = Int(floor(Double(j / 2))) }
            maxOdd = max(maxOdd, j)
        }

        for i in nums {
            if i % 2 == 1 { // i is odd
                if 2 * i > maxOdd {
                    dev.append((2 * i - maxOdd, maxOdd-i))
                } else {
                    dev.append((Int.max, maxOdd - 2 * i))
                }
            } else {
                if i < maxOdd { // i is even
                    dev.append((Int.max, maxOdd - i))
                } else {
                    var j = i
                    while j % 2 == 0 && j > maxOdd { j = j / 2 }
                    if j < maxOdd { dev.append((2 * j - maxOdd, maxOdd - j)) }
                }
            }
        }

        dev.sort{ $0 > $1 }
        
        if dev.count == 0 { return 0 }
        var maxDown: [Int] = Array(repeating: 0, count: dev.count)

        for i in 0..<maxDown.count {
            cur = max(cur, dev[i].1)
            maxDown[i] = cur
        }

        var mn = (min(maxDown.last!, dev[0].0))
        for i in 0..<maxDown.count - 1 where dev[i + 1].0 != Int.max { mn = min(mn, (maxDown[i] + dev[i + 1].0)) }
        return Int(mn)
    }

}