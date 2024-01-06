class Solution {

    // Solution by Sergey Leschev
    // 2931. Maximum Spending After Buying Items

    // Time complexity: O(n logn)
    // Space complexity: O(n)

    func maxSpending(_ values: [[Int]]) -> Int {
        // Alias for long long data type
        typealias ll = Int64

        // Flatten the 2D array into a 1D array
        var flattenedValues: [ll] = []
        for row in values {
            flattenedValues.append(contentsOf: row.map { ll($0) })
        }

        // Sort the values in ascending order
        flattenedValues.sort()

        // Variable to store the final result
        var ans: ll = 0

        // Calculate the maximum spending
        for i in 0..<flattenedValues.count {
            ans += flattenedValues[i] * ll(i + 1)
        }

        // Return the maximum spending
        return Int(ans)
    }
}
