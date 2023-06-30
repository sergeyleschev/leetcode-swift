class Solution {

    // Solution by Sergey Leschev

    // 1041. Robot Bounded In Circle
    // On an infinite plane, a robot initially stands at (0, 0) and faces north. The robot can receive one of three instructions:
    // "G": go straight 1 unit;
    // "L": turn 90 degrees to the left;
    // "R": turn 90 degrees to the right.
    // The robot performs the instructions given in order, and repeats them forever.
    // Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.

    // Finds if the robot is bounded in a circle.
    
    // - Parameter instructions: Movement instructions.
    // - Returns: True if there is a circle that the robot never leaves, otherwise returns false.

    // Example 1:
    // Input: instructions = "GGLLGG"
    // Output: true
    // Explanation: The robot moves from (0,0) to (0,2), turns 180 degrees, and then returns to (0,0).
    // When repeating these instructions, the robot remains in the circle of radius 2 centered at the origin.

    // Example 2:
    // Input: instructions = "GG"
    // Output: false
    // Explanation: The robot moves north indefinitely.

    // Example 3:
    // Input: instructions = "GL"
    // Output: true
    // Explanation: The robot moves from (0, 0) -> (0, 1) -> (-1, 1) -> (-1, 0) -> (0, 0) -> ...

    // Constraints:
    // 1 <= instructions.length <= 100
    // instructions[i] is 'G', 'L' or, 'R'.

    // - Complexity:
    //   - time: O(n), where n is the number of instructions.
    //   - space: O(1), only constant space is used.
    
    func isRobotBounded(_ instructions: String) -> Bool {
        var directions: [(x: Int, y: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var x = 0
        var y = 0
        var idx = 0

        for instruction in instructions {
            if instruction == "L" {
                idx = (idx + 3) % 4
            } else if instruction == "R" {
                idx = (idx + 1) % 4
            } else {
                x += directions[idx].x
                y += directions[idx].y
            }
        }

        return (x == 0 && y == 0) || idx != 0
    }

}