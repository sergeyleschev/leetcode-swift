class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1185. Day of the Week
    // Given a date, return the corresponding day of the week for that date.
    // The input is given as three integers representing the day, month and year respectively.
    // Return the answer as one of the following values {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}.

    // Example 1:
    // Input: day = 31, month = 8, year = 2019
    // Output: "Saturday"

    // Example 2:
    // Input: day = 18, month = 7, year = 1999
    // Output: "Sunday"

    // Example 3:
    // Input: day = 15, month = 8, year = 1993
    // Output: "Sunday"

    // Constraints:
    // The given dates are valid dates between the years 1971 and 2100.

    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let numOfDays: [Int: Int] = [1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31] // leap year: 2020      
        let days: [String] = ["Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"] // since 1/1/1971 is Friday
        var totalDays = -1 // zero based index


        func isLeapYear(_ year: Int) -> Bool { year % 4 == 0 ? (year % 100 == 0 ? (year % 400 == 0 ? true : false) : true) : false }

        for i in 1971..<year { totalDays += isLeapYear(i) ? 366 : 365 }
        for i in 1..<month { totalDays += numOfDays[i]! }
        if month > 2 && isLeapYear(year) { totalDays += 1 }
        totalDays += day
        return days[totalDays % 7]
    }

}