class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1604. Alert Using Same Key-Card Three or More Times in a One Hour Period
    // LeetCode company workers use key-cards to unlock office doors. Each time a worker uses their key-card, the security system saves the worker's name and the time when it was used. The system emits an alert if any worker uses the key-card three or more times in a one-hour period.
    // You are given a list of strings keyName and keyTime where [keyName[i], keyTime[i]] corresponds to a person's name and the time when their key-card was used in a single day.
    // Access times are given in the 24-hour time format "HH:MM", such as "23:51" and "09:49".
    // Return a list of unique worker names who received an alert for frequent keycard use. Sort the names in ascending order alphabetically.
    // Notice that "10:00" - "11:00" is considered to be within a one-hour period, while "22:51" - "23:52" is not considered to be within a one-hour period.

    // Example 1:
    // Input: keyName = ["daniel","daniel","daniel","luis","luis","luis","luis"], keyTime = ["10:00","10:40","11:00","09:00","11:00","13:00","15:00"]
    // Output: ["daniel"]
    // Explanation: "daniel" used the keycard 3 times in a one-hour period ("10:00","10:40", "11:00").

    // Example 2:
    // Input: keyName = ["alice","alice","alice","bob","bob","bob","bob"], keyTime = ["12:01","12:00","18:00","21:00","21:20","21:30","23:00"]
    // Output: ["bob"]
    // Explanation: "bob" used the keycard 3 times in a one-hour period ("21:00","21:20", "21:30").

    // Example 3:
    // Input: keyName = ["john","john","john"], keyTime = ["23:58","23:59","00:01"]
    // Output: []

    // Example 4:
    // Input: keyName = ["leslie","leslie","leslie","clare","clare","clare","clare"], keyTime = ["13:00","13:20","14:00","18:00","18:51","19:30","19:49"]
    // Output: ["clare","leslie"]

    // Constraints:
    // 1 <= keyName.length, keyTime.length <= 10^5
    // keyName.length == keyTime.length
    // keyTime[i] is in the format "HH:MM".
    // [keyName[i], keyTime[i]] is unique.
    // 1 <= keyName[i].length <= 10
    // keyName[i] contains only lowercase English letters.

    func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
        var ans = [String]()
        var record = [String:[Int]]()


        func parseTime(_ timeStr: String) -> Int {
            var time = timeStr
            let hour = Int(String(time[...time.index(after: time.startIndex)]))!
            time.removeFirst(3)
            let min = Int(String(time))!
            return hour * 60 + min
        }

        for idx in 0..<keyName.count { record[keyName[idx], default: []].append(parseTime(keyTime[idx])) }
        for (name, rec) in record {
            let sortedTime = rec.sorted()
            guard sortedTime.count >= 3 else { continue }
            for i in 2..<sortedTime.count where sortedTime[i] - sortedTime[i - 2] <= 60 { ans.append(name); break }
        }
        return ans.sorted()
    }

}