class Solution {

    // Solution by Sergey Leschev

    // 1563. Stone Game V
    // There are several stones arranged in a row, and each stone has an associated value which is an integer given in the array stoneValue.
    // In each round of the game, Alice divides the row into two non-empty rows (i.e. left row and right row), then Bob calculates the value of each row which is the sum of the values of all the stones in this row. Bob throws away the row which has the maximum value, and Alice's score increases by the value of the remaining row. If the value of the two rows are equal, Bob lets Alice decide which row will be thrown away. The next round starts with the remaining row.
    // The game ends when there is only one stone remaining. Alice's is initially zero.

    // Return the maximum score that Alice can obtain.

    // Example 1:
    // Input: stoneValue = [6,2,3,4,5,5]
    // Output: 18
    // Explanation: In the first round, Alice divides the row to [6,2,3], [4,5,5]. The left row has the value 11 and the right row has value 14. Bob throws away the right row and Alice's score is now 11.
    // In the second round Alice divides the row to [6], [2,3]. This time Bob throws away the left row and Alice's score becomes 16 (11 + 5).
    // The last round Alice has only one choice to divide the row which is [2], [3]. Bob throws away the right row and Alice's score is now 18 (16 + 2). The game ends because only one stone is remaining in the row.

    // Example 2:
    // Input: stoneValue = [7,7,7,7,7,7,7]
    // Output: 28

    // Example 3:
    // Input: stoneValue = [4]
    // Output: 0

    // Constraints:
    // 1 <= stoneValue.length <= 500
    // 1 <= stoneValue[i] <= 10^6

    func stoneGameV(_ stoneValue: [Int]) -> Int {
        let N = stoneValue.count
        let accu = stoneValue.reduce(into: [0]) { arr, val in arr.append(arr.last! + val) }
        var memo = [[Int?]](repeating: .init(repeating: nil, count: N + 1), count: N + 1)


        func worker(_ lo: Int, _ hi: Int) -> Int {
            if let m = memo[lo][hi] { return m }
            switch hi - lo + 1 {
            case 1: return 0
            case 2: return min(stoneValue[lo - 1], stoneValue[hi - 1])
            default:
                var ans = 0
                for i in lo..<hi {
                    // [lo, i], [i + 1, hi]
                    let left = accu[i] - accu[lo - 1]
                    let right = accu[hi] - accu[i]
                    let a1 = left <= right ? left + worker(lo, i) : 0
                    let a2 = left >= right ? right + worker(i + 1, hi) : 0
                    ans = max(ans, a1, a2)
                }
                memo[lo][hi] = ans
                return ans
            }
        }

        return worker(1, N)
    }

}