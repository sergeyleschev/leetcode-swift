class Solution {

    // Solution by Sergey Leschev

    // 401. Binary Watch
    // A binary watch has 4 LEDs on the top which represent the hours (0-11), and the 6 LEDs on the bottom represent the minutes (0-59). Each LED represents a zero or one, with the least significant bit on the right.
    // For example, the below binary watch reads "4:51".
    // Given an integer turnedOn which represents the number of LEDs that are currently on, return all possible times the watch could represent. You may return the answer in any order.
    // The hour must not contain a leading zero.
    // For example, "01:00" is not valid. It should be "1:00".
    // The minute must be consist of two digits and may contain a leading zero.
    // For example, "10:2" is not valid. It should be "10:02".

    // Example 1:
    // Input: turnedOn = 1
    // Output: ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]

    // Example 2:
    // Input: turnedOn = 9
    // Output: []

    // Constraints:
    // 0 <= turnedOn <= 10

    func readBinaryWatch(_ num: Int) -> [String] {
        let hours = [
            ["0"],
            ["1", "2", "4", "8"],
            ["3", "5", "6", "9", "10"],
            ["7", "11"],
        ]
        let minutes = [
            ["00"],
            ["01", "02", "04", "08", "16", "32"],
            [
                "03", "05", "06", "09", "10", "12", "17", "18", "20", "24", "33", "34", "36", "40",
                "48",
            ],
            [
                "07", "11", "13", "14", "19", "21", "22", "25", "26", "28", "35", "37", "38", "41",
                "42", "44", "49", "50", "52", "56",
            ],
            ["15", "23", "27", "29", "30", "39", "43", "45", "46", "51", "53", "54", "57", "58"],
            ["31", "47", "55", "59"],
        ]

        var array = [String]()
        var index = 0

        while index <= 3 && index <= num {
            if num - index <= 5 {
                for hour in hours[index] {
                    for minute in minutes[num - index] {
                        array.append(hour + ":" + minute)
                    }
                }
            }
            index += 1
        }

        return array
    }

}
