class Solution {

    // Solution @ Sergey Leschev

    // 1109. Corporate Flight Bookings
    // There are n flights that are labeled from 1 to n.
    // You are given an array of flight bookings bookings, where bookings[i] = [firsti, lasti, seatsi] represents a booking for flights firsti through lasti (inclusive) with seatsi seats reserved for each flight in the range.
    // Return an array answer of length n, where answer[i] is the total number of seats reserved for flight i.

    // Example 1:
    // Input: bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
    // Output: [10,55,45,25,25]
    // Explanation:
    // Flight labels:        1   2   3   4   5
    // Booking 1 reserved:  10  10
    // Booking 2 reserved:      20  20
    // Booking 3 reserved:      25  25  25  25
    // Total seats:         10  55  45  25  25
    // Hence, answer = [10,55,45,25,25]

    // Example 2:
    // Input: bookings = [[1,2,10],[2,2,15]], n = 2
    // Output: [10,25]
    // Explanation:
    // Flight labels:        1   2
    // Booking 1 reserved:  10  10
    // Booking 2 reserved:      15
    // Total seats:         10  25
    // Hence, answer = [10,25]

    // Constraints:
    // 1 <= n <= 2 * 10^4
    // 1 <= bookings.length <= 2 * 10^4
    // bookings[i].length == 3
    // 1 <= firsti <= lasti <= n
    // 1 <= seatsi <= 10^4

    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var openings: [Int: Int] = [:]
        var closings: [Int: Int] = [:]
        var count = 0
        var result: [Int] = []

        for booking in bookings {
            let opening = booking[0]
            let closing = booking[1]
            let count = booking[2]
            openings[opening, default: 0] += count
            closings[closing, default: 0] += count
        }

        for i in 1 ... n {
            let opening = openings[i, default: 0]
            let closing = closings[i - 1, default: 0]
            count = count + opening - closing
            result.append(count)
        }

        return result
    }
    
}