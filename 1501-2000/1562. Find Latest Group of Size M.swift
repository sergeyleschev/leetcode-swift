class Solution {

    // Solution by Sergey Leschev

    // 1562. Find Latest Group of Size M
    // Given an array arr that represents a permutation of numbers from 1 to n. You have a binary string of size n that initially has all its bits set to zero.
    // At each step i (assuming both the binary string and arr are 1-indexed) from 1 to n, the bit at position arr[i] is set to 1. You are given an integer m and you need to find the latest step at which there exists a group of ones of length m. A group of ones is a contiguous substring of 1s such that it cannot be extended in either direction.

    // Return the latest step at which there exists a group of ones of length exactly m. If no such group exists, return -1.

    // Example 1:
    // Input: arr = [3,5,1,2,4], m = 1
    // Output: 4
    // Explanation:
    // Step 1: "00100", groups: ["1"]
    // Step 2: "00101", groups: ["1", "1"]
    // Step 3: "10101", groups: ["1", "1", "1"]
    // Step 4: "11101", groups: ["111", "1"]
    // Step 5: "11111", groups: ["11111"]
    // The latest step at which there exists a group of size 1 is step 4.

    // Example 2:
    // Input: arr = [3,1,5,4,2], m = 2
    // Output: -1
    // Explanation:
    // Step 1: "00100", groups: ["1"]
    // Step 2: "10100", groups: ["1", "1"]
    // Step 3: "10101", groups: ["1", "1", "1"]
    // Step 4: "10111", groups: ["1", "111"]
    // Step 5: "11111", groups: ["11111"]
    // No group of size 2 exists during any step.

    // Example 3:
    // Input: arr = [1], m = 1
    // Output: 1

    // Example 4:
    // Input: arr = [2,1], m = 2
    // Output: 2

    // Constraints:
    // n == arr.length
    // 1 <= n <= 10^5
    // 1 <= arr[i] <= n
    // All integers in arr are distinct.
    // 1 <= m <= arr.length

    func findLatestStep(_ arr: [Int], _ m: Int) -> Int {
        var ans = -1
        let n = arr.count
        var start = [Int?](repeating: nil, count: n)
        var end = [Int?](repeating: nil, count: n)
        var length = [Int: Set<[Int]>]()
        
        for i in 0..<n {
            let idx = arr[i] - 1
            start[idx] = idx
            end[idx] = idx
            var flag = false

            if idx + 1 < n {
                if let idx2 = start[idx + 1] {
                    length[idx2 - idx]?.remove([idx + 1, idx2])
                    start[idx] = idx2
                    flag = true
                    length[idx2 - idx + 1, default: [] ].insert([idx,idx2])
                    start[idx + 1] = nil
                }
            }
            
            if idx > 0 {
                if let idx2 = end[idx - 1] {
                    flag = true
                    length[idx - idx2]?.remove([idx2,idx - 1])
                    end[idx] = idx2
                    end[idx - 1] = nil
                    length[idx - idx2 + 1, default: []].insert([idx2,idx])
                }
            }
            
            if flag {
                if let left = end[idx], let right = start[idx] {
                    length[idx - left + 1 ]?.remove([left,idx])
                    length[right - idx + 1]?.remove([idx,right])
                    start[idx] = nil
                    end[idx] = nil
                    start[left] = right
                    end[right] = left
                    length[right - left + 1, default: [] ].insert([left,right])
                }
            } else { length[1, default: [] ].insert([idx,idx]) }
            if let indices = length[m],!indices.isEmpty { ans = max(ans, i + 1) }
        }
        return ans
    }

}