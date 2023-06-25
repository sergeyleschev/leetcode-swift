class Solution {

    // Solution @ Sergey Leschev

    // 858. Mirror Reflection
    // There is a special square room with mirrors on each of the four walls. Except for the southwest corner, there are receptors on each of the remaining corners, numbered 0, 1, and 2.
    // The square room has walls of length p, and a laser ray from the southwest corner first meets the east wall at a distance q from the 0th receptor.
    // Return the number of the receptor that the ray meets first.  (It is guaranteed that the ray will meet a receptor eventually.)

    // Finds the number of the receptor that the ray meets first.

    // - Parameters:
    //   - p: Walls length.
    //   - q: The distance where a laser ray first meets the east wall.
    // - Returns: The number of the receptor.

    // Example 1:
    // Input: p = 2, q = 1
    // Output: 2
    // Explanation: The ray meets receptor 2 the first time it gets reflected back to the left wall.

    // Note:
    // 1 <= p <= 1000
    // 0 <= q <= p

    // - Complexity:
    //   - time: O(log(p)), where p is wall length.
    //   - space: O(1), only constant space is used.
    
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        var m = q
        var n = p

        while m % 2 == 0, n % 2 == 0 {
            m /= 2
            n /= 2
        }

        if m % 2 == 0, n % 2 == 1 { return 0 }
        if m % 2 == 1, n % 2 == 1 { return 1 }
        if m % 2 == 1, n % 2 == 0 { return 2 }

        return -1
    }

}