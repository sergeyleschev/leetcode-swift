class Solution {

    // 672. Bulb Switcher II
    // There is a room with n bulbs labeled from 1 to n that all are turned on initially, and four buttons on the wall. Each of the four buttons has a different functionality where:
    // Button 1: Flips the status of all the bulbs.
    // Button 2: Flips the status of all the bulbs with even labels (i.e., 2, 4, ...).
    // Button 3: Flips the status of all the bulbs with odd labels (i.e., 1, 3, ...).
    // Button 4: Flips the status of all the bulbs with a label j = 3k + 1 where k = 0, 1, 2, ... (i.e., 1, 4, 7, 10, ...).
    // You will press one of the four mentioned buttons exactly presses times.
    // Given the two integers n and presses, return the number of different statuses after pressing the four buttons exactly presses times.

    // Example 1:
    // Input: n = 1, presses = 1
    // Output: 2
    // Explanation: Status can be: [on], [off].

    // Example 2:
    // Input: n = 2, presses = 1
    // Output: 3
    // Explanation: Status can be: [on, off], [off, on], [off, off].

    // Example 3:
    // Input: n = 3, presses = 1
    // Output: 4
    // Explanation: Status can be: [off, on, off], [on, off, on], [off, off, off], [off, on, on].

    // Constraints:
    // 1 <= n <= 1000
    // 0 <= presses <= 1000

    func flipLights(_ n: Int, _ m: Int) -> Int {
        if m * n == 0 { return 1 }
        if n == 1 { return 2 }
        if n == 2 { return 4 - (m % 2) }
        if m == 1 { return 4 }
        if m == 2 { return 7 }
        
        return 8
    }
    
}