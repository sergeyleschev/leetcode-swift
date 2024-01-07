class Solution {

    // Solution by Sergey Leschev
    // 2960. Count Tested Devices After Test Operations

    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func countTestedDevices(_ batteryPercentages: [Int]) -> Int {
        var testedDevices = 0
        for percentage in batteryPercentages {
            testedDevices += (percentage > testedDevices) ? 1 : 0
        }
        return testedDevices
    }
}
