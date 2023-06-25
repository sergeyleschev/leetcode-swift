class Solution {

    // Solution @ Sergey Leschev

    // 923. 3Sum With Multiplicity
    // Given an integer array arr, and an integer target, return the number of tuples i, j, k such that i < j < k and arr[i] + arr[j] + arr[k] == target.
    // As the answer can be very large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: arr = [1,1,2,2,3,3,4,4,5,5], target = 8
    // Output: 20
    // Explanation: 
    // Enumerating by the values (arr[i], arr[j], arr[k]):
    // (1, 2, 5) occurs 8 times;
    // (1, 3, 4) occurs 8 times;
    // (2, 2, 4) occurs 2 times;
    // (2, 3, 3) occurs 2 times.

    // Example 2:
    // Input: arr = [1,1,2,2,2,2], target = 5
    // Output: 12
    // Explanation: 
    // arr[i] = 1, arr[j] = arr[k] = 2 occurs 12 times:
    // We choose one 1 from [1,1] in 2 ways,
    // and two 2s from [2,2,2,2] in 6 ways.

    // Constraints:
    // 3 <= arr.length <= 3000
    // 0 <= arr[i] <= 100
    // 0 <= target <= 300

    // Solution:
    // 3sum
    // buid map -> [num: count]
    // then sort map.keys
    // for each key, check if we can find other 2 elements(x, y, z) that sum as target
    // cases:
    // - x == y == z
    //     res += map[x] * (map[x]-1) * (map[x]-2) / 6
    // - x == y < z
    //     res += map[x] * (map[x]-1) / 2 * map[z]
    // - x < y == z
    //     res += map[x] * map[y] * (map[y]-1) / 2
    // - x < y < z
    //     res += map[x] * map[y] * map[z]

    // - Complexity:
    //   - time: O(n^2)
    //   - space: O(n)

    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        let mod = Int(1e9 + 7)
        // [num: count]
        var map = [Int: Int]()
        var res = 0
        for num in arr { map[num, default: 0] += 1 }
        var keys = map.keys.sorted()
        let nK = keys.count

        for i in 0..<nK {
            let x = keys[i]
            let temp = target - x
            var j = i
            var k = nK - 1

            while j <= k {
                let y = keys[j]
                let z = keys[k]

                if y + z == temp {
                    if i < j, j < k {
                        res += map[x]! * map[y]! * map[z]!
                    } else if i == j, j < k {
                        res += map[x]! * (map[x]! - 1) / 2 * map[z]!
                    } else if i < j, j == k {
                        res += map[x]! * map[y]! * (map[y]! - 1) / 2
                    } else if i == j, j == k {
                        res += map[x]! * (map[x]! - 1) * (map[x]! - 2) / 6
                    }
                    j += 1
                    k -= 1
                } else if y + z < temp {
                    j += 1
                } else if y + z > temp {
                    k -= 1
                }
            }
        }

        return res % mod
    }

}