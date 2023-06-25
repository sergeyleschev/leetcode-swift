class Solution {

    // Solution @ Sergey Leschev

    // 1154. Day of the Year
    // Given a string date representing a Gregorian calendar date formatted as YYYY-MM-DD, return the day number of the year.

    // Example 1:
    // Input: date = "2019-01-09"
    // Output: 9
    // Explanation: Given date is the 9th day of the year in 2019.

    // Example 2:
    // Input: date = "2019-02-10"
    // Output: 41

    // Example 3:
    // Input: date = "2003-03-01"
    // Output: 60

    // Example 4:
    // Input: date = "2004-03-01"
    // Output: 61

    // Constraints:
    // date.length == 10
    // date[4] == date[7] == '-', and all other date[i]'s are digits
    // date represents a calendar date between Jan 1st, 1900 and Dec 31, 2019.

    func dayOfYear(_ date: String) -> Int {
        let parts =  date.components(separatedBy: CharacterSet(charactersIn: "-"))
        let days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let dateNumer = parts.map { (str) -> Int in Int(str)! }
        var totalDays = 0

        for month in 1..<dateNumer[1]{
            if month == 2 {
                totalDays += (isLeapYear(year: dateNumer[0]) ? 29 : 28)
                continue
            }
            totalDays += days[month  - 1]
        }
        
        totalDays += dateNumer[2]
        return totalDays
    }


    private func isLeapYear(year: Int) -> Bool { (year % 100 != 0 && year % 4 == 0) || (year % 400 == 0 ) }

}