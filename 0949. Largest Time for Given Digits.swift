class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 949. Largest Time for Given Digits
    // Given an array arr of 4 digits, find the latest 24-hour time that can be made using each digit exactly once.
    // 24-hour times are formatted as "HH:MM", where HH is between 00 and 23, and MM is between 00 and 59. The earliest 24-hour time is 00:00, and the latest is 23:59.
    // Return the latest 24-hour time in "HH:MM" format.  If no valid time can be made, return an empty string.

    // Finds the largest 24 hour time that can be made from an array.

    // - Parameter A: The array.
    // - Returns: The largest 24 hour time. If no valid time can be made, returns an empty string.

    // Example 1:
    // Input: arr = [1,2,3,4]
    // Output: "23:41"
    // Explanation: The valid 24-hour times are "12:34", "12:43", "13:24", "13:42", "14:23", "14:32", "21:34", "21:43", "23:14", and "23:41". Of these times, "23:41" is the latest.

    // Example 2:
    // Input: arr = [5,5,5,5]
    // Output: ""
    // Explanation: There are no valid 24-hour times as "55:55" is not valid.

    // Example 3:
    // Input: arr = [0,0,0,0]
    // Output: "00:00"

    // Example 4:
    // Input: arr = [0,0,1,0]
    // Output: "10:00"

    // Constraints:
    // arr.length == 4
    // 0 <= arr[i] <= 9

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    private var maxTime = -1


    func largestTimeFromDigits(_ A: [Int]) -> String {
        maxTime = -1
        var array = A
        permutate(&array, start: 0)
        guard maxTime != -1 else { return "" }

        return String(format: "%02d:%02d", maxTime / 60, maxTime % 60)
    }


    private func permutate(_ array: inout [Int], start: Int) {
        guard array.count != start else { buildTime(array); return }

        for i in start..<array.count {
            array.swapAt(i, start)
            permutate(&array, start: start + 1)
            array.swapAt(i, start)
        }
    }


    private func buildTime(_ array: [Int]) {
        let hour = array[0] * 10 + array[1]
        let minute = array[2] * 10 + array[3]

        guard hour < 24, minute < 60 else { return }
        maxTime = max(maxTime, hour * 60 + minute)
    }

}