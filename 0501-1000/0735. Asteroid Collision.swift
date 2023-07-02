class Solution {

    // Solution by Sergey Leschev

    // 735. Asteroid Collision
    // We are given an array asteroids of integers representing asteroids in a row.
    // For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.
    // Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

    // Finds out the state of the asteroids after all collisions.

    // - Parameter asteroids: An array of asteroids.
    // - Returns: The state of the asteroids after all collisions.

    // Example 1:
    // Input: asteroids = [5,10,-5]
    // Output: [5,10]
    // Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.

    // Example 2:
    // Input: asteroids = [8,-8]
    // Output: []
    // Explanation: The 8 and -8 collide exploding each other.

    // Example 3:
    // Input: asteroids = [10,2,-5]
    // Output: [10]
    // Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.

    // Example 4:
    // Input: asteroids = [-2,-1,1,2]
    // Output: [-2,-1,1,2]
    // Explanation: The -2 and -1 are moving left, while the 1 and 2 are moving right. Asteroids moving the same direction never meet, so no asteroids will meet each other.

    // Constraints:
    // 2 <= asteroids.length <= 10^4
    // -1000 <= asteroids[i] <= 1000
    // asteroids[i] != 0

    // - Complexity:
    //   - time: O(n), where n is the number of asteroids.
    //   - space: O(n), where n is the number of asteroids.

    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var ans = [Int]()

        for asteroid in asteroids {
            guard asteroid < 0 else {
                ans.append(asteroid)
                continue
            }

            while let last = ans.last, last > 0, last < abs(asteroid) { ans.removeLast() }

            if let last = ans.last, last == abs(asteroid) {
                ans.removeLast()
            } else if ans.isEmpty || ans.last ?? Int.max < 0 {
                ans.append(asteroid)
            }
        }

        return ans
    }

}
