class Solution {

    // Solution by Sergey Leschev
    // 2933. High-Access Employees

    func findHighAccessEmployees(_ access_times: [[String]]) -> [String] {
        var times = [String: [Int]]()

        for v in access_times {
            let s = v[1]
            let minutes = Int(s.prefix(2))! * 60 + Int(s.suffix(2))!
            times[v[0], default: []].append(minutes)
        }

        var ans = [String]()

        for (employee, time) in times {
            var sweep = Array(repeating: 0, count: 1441)

            for t in time {
                // contribution of each access for the next 59 minutes
                sweep[t] += 1
                if t + 60 < 1441 {
                    sweep[t + 60] -= 1
                }
            }

            // check for at least 3 overlapping access times
            var count = 0

            for i in 0..<1441 {
                count += sweep[i]

                if count >= 3 {
                    ans.append(employee)
                    break
                }
            }
        }

        return ans
    }
}
