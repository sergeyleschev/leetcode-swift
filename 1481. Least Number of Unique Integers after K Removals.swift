class Solution {

    // 1481. Least Number of Unique Integers after K Removals
    // Given an array of integers arr and an integer k. Find the least number of unique integers after removing exactly k elements.

    // Example 1:
    // Input: arr = [5,5,4], k = 1
    // Output: 1
    // Explanation: Remove the single 4, only 5 is left.

    // Example 2:
    // Input: arr = [4,3,1,1,3,3,2], k = 3
    // Output: 2
    // Explanation: Remove 4, 2 and either one of the two 1s or three 3s. 1 and 3 will be left.
     
    // Constraints:
    // 1 <= arr.length <= 10^5
    // 1 <= arr[i] <= 10^9
    // 0 <= k <= arr.length

    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var map = [Int: Int]()        
        for num in arr { map[num] = (map[num] ?? 0) + 1 }
        var result = map.count
        var m = k

        for count in map.values.sorted() where m > 0 && count <= m {
            result -= 1
            m -= count
        }
        
        return result
    }
    
}