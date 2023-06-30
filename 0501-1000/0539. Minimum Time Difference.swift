class Solution {

    // Solution by Sergey Leschev

    // 539. Minimum Time Difference
    // Given a list of 24-hour clock time points in "HH:MM" format, return the minimum minutes difference between any two time-points in the list.

    // Example 1:
    // Input: timePoints = ["23:59","00:00"]
    // Output: 1

    // Example 2:
    // Input: timePoints = ["00:00","23:59","00:00"]
    // Output: 0

    // Constraints:
    // 2 <= timePoints <= 2 * 10^4
    // timePoints[i] is in the format "HH:MM".

    func findMinDifference(_ timePoints: [String]) -> Int {
        var result = Int.max
        var times = [Int]()
        
        for time in timePoints {
            var date = time.components(separatedBy: ":")
            times.append(Int(date[0])! * 60 + Int(date[1])!)
        }

        times.sort()
        times.append(times.first! + 1440)
        
        for i in 0..<times.count - 1{
            let interval = times[i + 1] - times[i]
            if result > interval {
                result = interval
            }
        }
        
        return result
    }
    
}