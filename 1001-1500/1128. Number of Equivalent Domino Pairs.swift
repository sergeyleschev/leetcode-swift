class Solution {

    // Solution by Sergey Leschev

    // 1128. Number of Equivalent Domino Pairs
    // Given a list of dominoes, dominoes[i] = [a, b] is equivalent to dominoes[j] = [c, d] if and only if either (a==c and b==d), or (a==d and b==c) - that is, one domino can be rotated to be equal to another domino.
    // Return the number of pairs (i, j) for which 0 <= i < j < dominoes.length, and dominoes[i] is equivalent to dominoes[j].

    // Example 1:
    // Input: dominoes = [[1,2],[2,1],[3,4],[5,6]]
    // Output: 1

    // Constraints:
    // 1 <= dominoes.length <= 40000
    // 1 <= dominoes[i][j] <= 9

    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var freq: [Int] = Array(repeating: 0, count: 100)
        var count = 0

        dominoes.forEach {
            let newDominoes = $0.sorted()
            let num = newDominoes[0] * 10 + newDominoes[1]
            count += freq[num]
            freq[num] += 1
        }

        return count
    }

}
