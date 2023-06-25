class Solution {

  // Solution @ Sergey Leschev

  // 347. Top K Frequent Elements
  // Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

  // Example 1:
  // Input: nums = [1,1,1,2,2,3], k = 2
  // Output: [1,2]

  // Example 2:
  // Input: nums = [1], k = 1
  // Output: [1]

  // Constraints:
  // 1 <= nums.length <= 10^5
  // k is in the range [1, the number of unique elements in the array].
  // It is guaranteed that the answer is unique.
   
  // Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

  // - Complexity:
  //   - time: O(N)
  //   - space: O(N log N)
    
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
      var map = [Int : Int]()
      
      for num in nums { map[num] = (map[num] ?? 0) + 1 }
      
      var keys = [Int](map.keys)
      keys.sort { map[$0]! > map[$1]! }
      
      return Array(keys[0..<k])
  }

}