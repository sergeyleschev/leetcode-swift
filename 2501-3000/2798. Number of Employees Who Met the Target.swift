class Solution {

    // Solution by Sergey Leschev
    // 2798. Number of Employees Who Met the Target

    func numberOfEmployeesWhoMetTarget(_ hours: [Int], _ target: Int) -> Int {
        var count = 0
        for h in hours {
            if h >= target {
                count += 1
            }
        }
        return count
    }
}
