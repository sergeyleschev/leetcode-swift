class Solution {

    // Solution by Sergey Leschev
    // 2739. Total Distance Traveled

    func distanceTraveled(_ mainTank: Int, _ additionalTank: Int) -> Int {
        (mainTank + min((mainTank - 1) / 4, additionalTank)) * 10
    }
}
