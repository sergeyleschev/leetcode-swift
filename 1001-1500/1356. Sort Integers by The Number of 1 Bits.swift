class Solution {

    // Solution by Sergey Leschev

    // 1356. Sort Integers by The Number of 1 Bits
    // Given an integer array arr. You have to sort the integers in the array in ascending order by the number of 1's in their binary representation and in case of two or more integers have the same number of 1's you have to sort them in ascending order.
    // Return the sorted array.

    // Example 1:
    // Input: arr = [0,1,2,3,4,5,6,7,8]
    // Output: [0,1,2,4,8,3,5,6,7]
    // Explanation: [0] is the only integer with 0 bits.
    // [1,2,4,8] all have 1 bit.
    // [3,5,6] have 2 bits.
    // [7] has 3 bits.
    // The sorted array by bits is [0,1,2,4,8,3,5,6,7]

    // Example 2:
    // Input: arr = [1024,512,256,128,64,32,16,8,4,2,1]
    // Output: [1,2,4,8,16,32,64,128,256,512,1024]
    // Explanation: All integers have 1 bit in the binary representation, you should just sort them in ascending order.

    // Example 3:
    // Input: arr = [10000,10000]
    // Output: [10000,10000]

    // Example 4:
    // Input: arr = [2,3,5,7,11,13,17,19]
    // Output: [2,3,5,17,7,11,13,19]

    // Example 5:
    // Input: arr = [10,100,1000,10000]
    // Output: [10,100,10000,1000]

    // Constraints:
    // 1 <= arr.length <= 500
    // 0 <= arr[i] <= 10^4

    func sortByBits(_ arr: [Int]) -> [Int] {
        var cache: [Int: Int] = [:]

        for num in arr {
            let bs = String(num, radix: 2)
            var count = 0
            for c in bs where c == Character("1") { count += 1 }
            cache[num] = count
        }

        let ans = arr.sorted { (n1, n2) -> Bool in
            if cache[n1]! == cache[n2]! { return n1 < n2 }
            return cache[n1]! < cache[n2]!
        }

        return ans
    }

}
