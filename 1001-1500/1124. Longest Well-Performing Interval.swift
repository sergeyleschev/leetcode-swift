class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1124. Longest Well-Performing Interval
    // We are given hours, a list of the number of hours worked per day for a given employee
    // A day is considered to be a tiring day if and only if the number of hours worked is (strictly) greater than 8.
    // A well-performing interval is an interval of days for which the number of tiring days is strictly larger than the number of non-tiring days.
    // Return the length of the longest well-performing interval.

    // Example 1:
    // Input: hours = [9,9,6,0,6,6,9]
    // Output: 3
    // Explanation: The longest well-performing interval is [9,9,6].

    // Constraints:
    // 1 <= hours.length <= 10000
    // 0 <= hours[i] <= 16

    func longestWPI(_ hours: [Int]) -> Int {
        var ans = 0
        let size  = hours.count
        var sum = [Int](repeating: 0, count: size + 1)

        let hoursCopy = hours.map { (val) -> Int in val > 8 ? 1 : -1 }
        
        for i in 0..<size { sum[i + 1] = sum[i] + hoursCopy[i] }
        for i in 0..<size {
            var j = size
            while j > i && j - i > ans  {
                if sum[i] < sum[j] { ans = j - i }
                j -= 1
            }
        }
        
        return ans
    }

}