class Solution {

    // Solution by Sergey Leschev

    // 1304. Find N Unique Integers Sum up to Zero
    // Given an integer n, return any array containing n unique integers such that they add up to 0.

    // Example 1:
    // Input: n = 5
    // Output: [-7,-1,1,3,4]
    // Explanation: These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].

    // Example 2:
    // Input: n = 3
    // Output: [-1,0,1]

    // Example 3:
    // Input: n = 1
    // Output: [0]

    // Constraints:
    // 1 <= n <= 1000

    func sumZero(_ n: Int) -> [Int] {
        var newArr = [Int]()
        var i = 0
        let limit = n / 2

        if n % 2 != 0 {
            newArr.append(0)
            i += 1
        } else {
            i += 1
        }

        while i <= limit {
            newArr.append(i)
            newArr.append(-i)
            i += 1
        }

        return newArr
    }

}
