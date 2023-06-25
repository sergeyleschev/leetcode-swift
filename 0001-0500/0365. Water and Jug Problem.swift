class Solution {

    // Solution @ Sergey Leschev

    // 365. Water and Jug Problem
    // You are given two jugs with capacities jug1Capacity and jug2Capacity liters. There is an infinite amount of water supply available. Determine whether it is possible to measure exactly targetCapacity liters using these two jugs.
    // If targetCapacity liters of water are measurable, you must have targetCapacity liters of water contained within one or both buckets by the end.
    // Operations allowed:
    // Fill any of the jugs with water.
    // Empty any of the jugs.
    // Pour water from one jug into another till the other jug is completely full, or the first jug itself is empty.

    // Example 1:
    // Input: jug1Capacity = 3, jug2Capacity = 5, targetCapacity = 4
    // Output: true
    // Explanation: The famous Die Hard example 

    // Example 2:
    // Input: jug1Capacity = 2, jug2Capacity = 6, targetCapacity = 5
    // Output: false

    // Example 3:
    // Input: jug1Capacity = 1, jug2Capacity = 2, targetCapacity = 3
    // Output: true

    // Constraints:
    // 1 <= jug1Capacity, jug2Capacity, targetCapacity <= 10^6

    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        if x + y < z { return false }
        if x == z || y == z || x + y == z { return true }
        if x == 0 && y == z { return true }
        
        return z % helper(x, y) == 0
    }


    func helper(_ x: Int, _ y: Int) -> Int {
        return x % y == 0 ? y : helper(y, x % y)
    }
    
}