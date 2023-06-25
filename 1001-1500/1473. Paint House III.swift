class Solution {

    // Solution @ Sergey Leschev

    // 1473. Paint House III
    // There is a row of m houses in a small city, each house must be painted with one of the n colors (labeled from 1 to n), some houses that have been painted last summer should not be painted again.
    // A neighborhood is a maximal group of continuous houses that are painted with the same color.
    // For example: houses = [1,2,2,3,3,2,1,1] contains 5 neighborhoods [{1}, {2,2}, {3,3}, {2}, {1,1}].
    // Given an array houses, an m x n matrix cost and an integer target where:
    // houses[i]: is the color of the house i, and 0 if the house is not painted yet.
    // cost[i][j]: is the cost of paint the house i with the color j + 1.

    // Return the minimum cost of painting all the remaining houses in such a way that there are exactly target neighborhoods. If it is not possible, return -1.

    // Example 1:
    // Input: houses = [0,0,0,0,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
    // Output: 9
    // Explanation: Paint houses of this way [1,2,2,1,1]
    // This array contains target = 3 neighborhoods, [{1}, {2,2}, {1,1}].
    // Cost of paint all houses (1 + 1 + 1 + 1 + 5) = 9.

    // Example 2:
    // Input: houses = [0,2,1,2,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
    // Output: 11
    // Explanation: Some houses are already painted, Paint the houses of this way [2,2,1,2,2]
    // This array contains target = 3 neighborhoods, [{2,2}, {1}, {2,2}]. 
    // Cost of paint the first and last house (10 + 1) = 11.

    // Example 3:
    // Input: houses = [0,0,0,0,0], cost = [[1,10],[10,1],[1,10],[10,1],[1,10]], m = 5, n = 2, target = 5
    // Output: 5

    // Example 4:
    // Input: houses = [3,1,2,3], cost = [[1,1,1],[1,1,1],[1,1,1],[1,1,1]], m = 4, n = 3, target = 3
    // Output: -1
    // Explanation: Houses are already painted with a total of 4 neighborhoods [{3},{1},{2},{3}] different of target = 3.

    // Constraints:
    // m == houses.length == cost.length
    // n == cost[i].length
    // 1 <= m <= 100
    // 1 <= n <= 20
    // 1 <= target <= m
    // 0 <= houses[i] <= n
    // 1 <= cost[i][j] <= 10^4

    func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        var table = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: target + 1), count: n + 1), count: m) // int table[m][n + 1][target + 1]
        var result = Int.max

        
        func memory(_ i: Int, _ j: Int, _ k: Int) -> Int { // i: house, j: color, k: district
            if k > i + 1 { return Int.max } // invalid district number
            if i < 0 { return 0 } // initial value
            if j < 1 ||  k < 1 { return Int.max } // invalid boundary
            if table[i][j][k] == -1 { table[i][j][k] = search(i, j, k) }
            return table[i][j][k]
        }


        func search(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if houses[i] != 0 { // has been painted
                if j != houses[i] { return Int.max } // invalid paint
                var result = memory(i - 1, j, k) // same district
                for p in 1...n where p != j { result = min(result, memory(i - 1, p, k - 1)) } // i color should be different from i - 1
                return result
            } else { // not been painted
                var result = memory(i - 1, j, k)
                for p in 1...n where p != j { result = min(result, memory(i - 1, p, k - 1)) }
                if result == Int.max { return result } // check if invalid
                return result + cost[i][j - 1]
            }
        }

        for i in 1...n { result = min(result, memory(m - 1, i, target)) } // search for every color
        return result == Int.max ? -1 : result
    }

}