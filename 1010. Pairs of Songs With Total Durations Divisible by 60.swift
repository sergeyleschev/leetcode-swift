class Solution {

    // 1010. Pairs of Songs With Total Durations Divisible by 60
    // You are given a list of songs where the ith song has a duration of time[i] seconds.
    // Return the number of pairs of songs for which their total duration in seconds is divisible by 60. Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.

    // Finds the number of pairs of songs for which their total duration in seconds is divisible by 60.

    // - Parameter time: A list of song duration.
    // - Returns: The number of pairs of songs.

    // Example 1:
    // Input: time = [30,20,150,100,40]
    // Output: 3
    // Explanation: Three pairs have a total duration divisible by 60:
    // (time[0] = 30, time[2] = 150): total duration 180
    // (time[1] = 20, time[3] = 100): total duration 120
    // (time[1] = 20, time[4] = 40): total duration 60

    // Example 2:
    // Input: time = [60,60,60]
    // Output: 3
    // Explanation: All three pairs have a total duration of 120, which is divisible by 60.

    // Constraints:
    // 1 <= time.length <= 6 * 10^4
    // 1 <= time[i] <= 500

    // - Complexity:
    //   - time: O(n), where n is the length of time.
    //   - space: O(n), where n is the length of time.
    
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var ans = 0
        var dict = [Int: Int]()
        
        for t in time {
            if t % 60 == 0 {
                ans += dict[0] ?? 0
            } else if let val = dict[60 - t % 60] {
                ans += val
            }
            
            dict[t % 60, default: 0] += 1
        }
        
        return ans
    }

}