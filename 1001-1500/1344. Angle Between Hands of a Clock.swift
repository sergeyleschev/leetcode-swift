class Solution {

    // Solution by Sergey Leschev

    // 1344. Angle Between Hands of a Clock
    // Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.

    // Calculates the smaller angle formed between the hour and the minute hand.
    
    // - Parameters:
    //   - hour: Hour hand.
    //   - minutes: Minute hand.
    // - Returns: The smaller angle between the hour and the minute hand.

    // Example 1:
    // Input: hour = 12, minutes = 30
    // Output: 165

    // Example 2:
    // Input: hour = 3, minutes = 30
    // Output: 75

    // Example 3:
    // Input: hour = 3, minutes = 15
    // Output: 7.5

    // Example 4:
    // Input: hour = 4, minutes = 50
    // Output: 155

    // Example 5:
    // Input: hour = 12, minutes = 0
    // Output: 0

    // Constraints:
    // 1 <= hour <= 12
    // 0 <= minutes <= 59
    // Answers within 10^-5 of the actual value will be accepted as correct.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hour = (Double(hour % 12) * 30.0) + (Double(minutes) * 0.5)
        let minutes = Double(minutes) * 6.0
        let ans = Double(abs(minutes - hour))

        return ans <= 180 ? ans : 360 - ans
    }

}