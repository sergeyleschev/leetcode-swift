class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 881. Boats to Save People
    // You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit.
    // Return the minimum number of boats to carry every given person.

    // Finds the minimum number of boats to carry every given person.
    //
    // - Parameters:
    //   - people: The people's weight.
    //   - limit: A maximum weight each boat can carry.
    // - Returns: The minimum number of boats.

    // Example 1:
    // Input: people = [1,2], limit = 3
    // Output: 1
    // Explanation: 1 boat (1, 2)

    // Example 2:
    // Input: people = [3,2,2,1], limit = 3
    // Output: 3
    // Explanation: 3 boats (1, 2), (2) and (3)

    // Example 3:
    // Input: people = [3,5,3,4], limit = 5
    // Output: 4
    // Explanation: 4 boats (3), (3), (4), (5)

    // Constraints:
    // 1 <= people.length <= 5 * 10^4
    // 1 <= people[i] <= limit <= 3 * 10^4

    // - Complexity:
    //   - time: O(n log(n)), where n is the number of people.
    //   - space: O(n), where n is the number of people.
    
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var ans = 0
        var i = 0
        var j = people.count - 1
        
        while i <= j {
            if people[i] + people[j] <= limit { i += 1 }
            j -= 1
            ans += 1
        }
        
        return ans
    }

}