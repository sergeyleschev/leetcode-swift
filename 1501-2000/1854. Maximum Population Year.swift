class Solution {

    // Solution by Sergey Leschev

    // 1854. Maximum Population Year
    // You are given a 2D integer array logs where each logs[i] = [birth(i), death(i)] indicates the birth and death years of the ith person.
    // The population of some year x is the number of people alive during that year. The ith person is counted in year x's population if x is in the inclusive range [birth(i), death(i) - 1]. Note that the person is not counted in the year that they die.

    // Return the earliest year with the maximum population.

    // Example 1:
    // Input: logs = [[1993,1999],[2000,2010]]
    // Output: 1993
    // Explanation: The maximum population is 1, and 1993 is the earliest year with this population.

    // Example 2:
    // Input: logs = [[1950,1961],[1960,1971],[1970,1981]]
    // Output: 1960
    // Explanation:
    // The maximum population is 2, and it had happened in years 1960 and 1970.
    // The earlier year between them is 1960.

    // Constraints:
    // 1 <= logs.length <= 100
    // 1950 <= birth(i) < death(i) <= 2050

    func maximumPopulation(_ logs: [[Int]]) -> Int {
        var lifePeriods = [Int](repeating: 0, count: 105)
        var total = 0
        var ans: (year: Int, num: Int) = (-1, -1)

        for log in logs {
            lifePeriods[log[0] - 1950] += 1
            lifePeriods[log[1] - 1950] -= 1
        }

        for year in 1950...2050 {
            total += lifePeriods[year - 1950]
            if total > ans.num {
                ans.year = year
                ans.num = total
            }
        }
        return ans.year
    }

}
