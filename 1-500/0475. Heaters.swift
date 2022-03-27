class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 475. Heaters
    // Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.
    // Every house can be warmed, as long as the house is within the heater's warm radius range. 
    // Given the positions of houses and heaters on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.
    // Notice that all the heaters follow your radius standard, and the warm radius will the same.

    // Example 1:
    // Input: houses = [1,2,3], heaters = [2]
    // Output: 1
    // Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.

    // Example 2:
    // Input: houses = [1,2,3,4], heaters = [1,4]
    // Output: 1
    // Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.

    // Example 3:
    // Input: houses = [1,5], heaters = [2]
    // Output: 3

    // Constraints:
    // 1 <= houses.length, heaters.length <= 3 * 10^4
    // 1 <= houses[i], heaters[i] <= 10^9

    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var result = 0
        var j = 0
        var sortHouses = houses.sorted()
        var sortHeaters = heaters.sorted()
        
        for i in 0..<sortHouses.count {
            while j < sortHeaters.count - 1 
                && abs(sortHeaters[j] - sortHouses[i]) >= abs(sortHeaters[j + 1] - sortHouses[i]) { j += 1 }
            result = max(result, abs(sortHeaters[j] - sortHouses[i]))
        }
        
        return result
    }

}