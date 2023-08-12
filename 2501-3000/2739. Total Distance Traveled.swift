class Solution {

    // Solution by Sergey Leschev
    // 2739. Total Distance Traveled

    // Time complexity: O(1)
    // Space complexity: O(1)

    func distanceTraveled(_ mainTank: Int, _ additionalTank: Int) -> Int {
        (mainTank + min((mainTank - 1) / 4, additionalTank)) * 10
    }
}
