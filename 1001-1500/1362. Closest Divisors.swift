class Solution {

    // Solution by Sergey Leschev

    // 1362. Closest Divisors
    // Given an integer num, find the closest two integers in absolute difference whose product equals num + 1 or num + 2.
    // Return the two integers in any order.

    // Example 1:
    // Input: num = 8
    // Output: [3,3]
    // Explanation: For num + 1 = 9, the closest divisors are 3 & 3, for num + 2 = 10, the closest divisors are 2 & 5, hence 3 & 3 is chosen.

    // Example 2:
    // Input: num = 123
    // Output: [5,25]

    // Example 3:
    // Input: num = 999
    // Output: [40,25]

    // Constraints:
    // 1 <= num <= 10^9

    func closestDivisors(_ num: Int) -> [Int] {
        func getTwoNearestFactors(_ n: Int) -> [Int] {
            let mid = Int(sqrt(Double(n)))
            var temp = mid
            while temp > 0 {
                if n % temp == 0 { return [temp,n / temp] }
                temp -= 1
            }
            return []
        }

        let pair1 = getTwoNearestFactors(num + 1)
        guard pair1[0] != pair1[1] else { return pair1 }
        let pair2 = getTwoNearestFactors(num + 2)
        return abs(pair1[1] - pair1[0]) > abs(pair2[1] - pair2[0]) ? pair2 : pair1
    }
    
 }