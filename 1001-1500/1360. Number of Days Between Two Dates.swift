class Solution {

    // Solution by Sergey Leschev

    // 1360. Number of Days Between Two Dates
    // Write a program to count the number of days between two dates.
    // The two dates are given as strings, their format is YYYY-MM-DD as shown in the examples.

    // Example 1:
    // Input: date1 = "2019-06-29", date2 = "2019-06-30"
    // Output: 1

    // Example 2:
    // Input: date1 = "2020-01-15", date2 = "2019-12-31"
    // Output: 15

    // Constraints:
    // The given dates are valid dates between the years 1971 and 2100.

    private let daysEachCommonYear = 365
    private let leapYears: Set<Int> = [
        1972, 1976, 1980, 1984, 1988, 1992, 1996, 2000,
        2004, 2008, 2012, 2016, 2020, 2024, 2028, 2032,
        2036, 2040, 2044, 2048, 2052, 2056, 2060, 2064,
        2068, 2072, 2076, 2080, 2084, 2088, 2092, 2096,
    ]
    private let daysEachMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    private typealias TDate = (year: Int, month: Int, day: Int)

    func daysBetweenDates(_ date1: String, _ date2: String) -> Int {

        func parseStrToMyDate(_ date: String) -> TDate {
            let arr = date.components(separatedBy: CharacterSet(charactersIn: "-")).map { Int($0)! }
            return (arr[0], arr[1], arr[2])
        }

        func CountDaysSince1970(_ date: TDate) -> Int {
            var ans = 0

            //Year
            ans +=
                (date.year - 1970) * daysEachCommonYear
                + leapYears.intersection(Set<Int>(1970..<date.year)).count
            //Month
            if date.month > 1 {
                for month in 1..<date.month { ans += daysEachMonth[month] }
                if date.month > 2 && leapYears.contains(date.year) { ans += 1 }
            }
            //Day
            ans += date.day
            return ans
        }

        return abs(
            CountDaysSince1970(parseStrToMyDate(date1))
                - CountDaysSince1970(parseStrToMyDate(date2)))
    }

}
