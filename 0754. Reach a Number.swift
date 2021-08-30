class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 754. Reach a Number
    // You are standing at position 0 on an infinite number line. There is a goal at position target.
    // On each move, you can either go left or right. During the nth move (starting from n == 1), you take n steps.
    // Return the minimum number of steps required to reach the destination.

    // Finds the minimum number of steps required to reach the destination.

    // - Parameter target: A goal.
    // - Returns: The minimum number of steps.

    // Example 1:
    // Input: target = 2
    // Output: 3
    // Explanation:
    // On the first move, we step from 0 to 1.
    // On the second move, we step  from 1 to -1.
    // On the third move, we step from -1 to 2.

    // Example 2:
    // Input: target = 3
    // Output: 2
    // Explanation:
    // On the first move, we step from 0 to 1.
    // On the second step, we step from 1 to 3.

    // Constraints:
    // -10^9 <= target <= 10^9
    // target != 0

    // - Complexity:
    //   - time: O(sqrt(target)), where target is the given target.
    //   - space: O(1), only constant space is used.
    
    func reachNumber(_ target: Int) -> Int {
        var target = abs(target)
        var step = 0
        
        while target > 0 {
            step += 1
            target -= step
        }
        
        return target % 2 == 0 ? step : step + (step % 2) + 1
    }

}