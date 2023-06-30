class Solution {

    // Solution by Sergey Leschev

    // 354. Russian Doll Envelopes
    // You are given a 2D array of integers envelopes where envelopes[i] = [wi, hi] represents the width and the height of an envelope.
    // One envelope can fit into another if and only if both the width and height of one envelope are greater than the other envelope's width and height.
    // Return the maximum number of envelopes you can Russian doll (i.e., put one inside the other).
    // Note: You cannot rotate an envelope.

    // Example 1:
    // Input: envelopes = [[5,4],[6,4],[6,7],[2,3]]
    // Output: 3
    // Explanation: The maximum number of envelopes you can Russian doll is 3 ([2,3] => [5,4] => [6,7]).

    // Example 2:
    // Input: envelopes = [[1,1],[1,1],[1,1]]
    // Output: 1

    // Constraints:
    // 1 <= envelopes.length <= 5000
    // envelopes[i].length == 2
    // 1 <= wi, hi <= 10^4

     func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
         var sorted = envelopes.sorted(by: { v1, v2 in
             if v1[0] == v2[0] { return v2[1] < v1[1] }
             return v1[0] < v2[0]
         })
         var length = 0
         var dp = Array(repeating:Int.max, count: envelopes.count)
     
         for i in 0..<sorted.count{
             let index = binarySearch(dp, sorted[i][1])
             
             dp[index] = sorted[i][1]
             if length == index{
                 length += 1
             }
         }
         
         return length
     }
     
    
     private func binarySearch(_ nums:[Int], _ target: Int)->Int{
         // finding the first index of target
         var left = 0 , right = nums.count - 1, mid = 0

         while left < right{
             mid = left + (right - left) / 2
             if target <= nums[mid]{
                 right = mid
             } else {
                 left = mid + 1
             }
         }
         
         return left
     }

}