class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1388. Pizza With 3n Slices
    // There is a pizza with 3n slices of varying size, you and your friends will take slices of pizza as follows:
    // You will pick any pizza slice.
    // Your friend Alice will pick next slice in anti clockwise direction of your pick. 
    // Your friend Bob will pick next slice in clockwise direction of your pick.
    // Repeat until there are no more slices of pizzas.
    // Sizes of Pizza slices is represented by circular array slices in clockwise direction.

    // Return the maximum possible sum of slice sizes which you can have.

    // Example 1:
    // Input: slices = [1,2,3,4,5,6]
    // Output: 10
    // Explanation: Pick pizza slice of size 4, Alice and Bob will pick slices with size 3 and 5 respectively. Then Pick slices with size 6, finally Alice and Bob will pick slice of size 2 and 1 respectively. Total = 4 + 6.

    // Example 2:
    // Input: slices = [8,9,8,6,1,1]
    // Output: 16
    // Output: Pick pizza slice of size 8 in each turn. If you pick slice with size 9 your partners will pick slices of size 8.

    // Example 3:
    // Input: slices = [4,1,2,5,8,3,1,9,7]
    // Output: 21

    // Example 4:
    // Input: slices = [3,1,2]
    // Output: 3

    // Constraints:
    // 1 <= slices.length <= 500
    // slices.length % 3 == 0
    // 1 <= slices[i] <= 1000

    // Solution: DP
    // pick n / 3 non-adjacent elements from circular array we cannot pick 0th and n-1th at the same time, because they are adjacent 2 cases
    // - pick 0th element, pick from 0...n - 2
    // - pick n-1th element, pick from 1...n - 1

    // - Complexity:
    //   - time: O(nk)
    //   - space: O(nk)

    func maxSizeSlices(_ slices: [Int]) -> Int {
        var total = 0
        let n = slices.count
        let k = n / 3
        
        total = max(total, check(Array(slices[0..<n - 1]), k))
        total = max(total, check(Array(slices[1...n - 1]), k))
        return total
    }


    func check(_ slices: [Int], _ k: Int) -> Int { // max sum when pick k non-adjacent elements from slices
        let n = slices.count
        var dp = Array( repeating: Array(repeating: 0, count: k + 1), count: n + 1) // dp[i][j] record max sum pick j elements from slices[0...i]

        for i in 1...n {
            for j in 1...k {
                if i == 1 { dp[i][j] = slices[0] } 
                else {
                    // dp[i - 1][j], don't pick ith elements
                    // dp[i - 2][j - 1], pick j - 1 elements from slices[0...i - 2]
                    dp[i][j] = max(
                        dp[i - 1][j],
                        dp[i - 2][j - 1] + slices[i - 1]
                    )
                }
            }
        }

        return dp[n][k]
    }

}