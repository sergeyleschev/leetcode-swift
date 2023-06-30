class Solution {

    // Solution by Sergey Leschev

    // 1007. Minimum Domino Rotations For Equal Row
    // In a row of dominoes, tops[i] and bottoms[i] represent the top and bottom halves of the ith domino. (A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.)
    // We may rotate the ith domino, so that tops[i] and bottoms[i] swap values.
    // Return the minimum number of rotations so that all the values in tops are the same, or all the values in bottoms are the same.
    // If it cannot be done, return -1.

    // Finds the minimum number of rotations so that all the values in A are the same, or all the values in B are the same.

    // - Parameters:
    //   - A: A array of dominoes.
    //   - B: B array of dominoes.
    // - Returns: The minimum number of rotations, if it cannot be done returns -1.

    // Example 1:
    // Input: tops = [2,1,2,4,2,2], bottoms = [5,2,6,2,3,2]
    // Output: 2
    // Explanation: 
    // The first figure represents the dominoes as given by tops and bottoms: before we do any rotations.
    // If we rotate the second and fourth dominoes, we can make every value in the top row equal to 2, as indicated by the second figure.

    // Example 2:
    // Input: tops = [3,5,1,2,3], bottoms = [3,6,3,3,4]
    // Output: -1
    // Explanation: 
    // In this case, it is not possible to rotate the dominoes to make one row of values equal.

    // Constraints:
    // 2 <= tops.length == bottoms.length <= 2 * 10^4
    // 1 <= tops[i], bottoms[i] <= 6

    // - Complexity:
    //   - time: O(n), where n is the length of A and the length of B.
    //   - space: O(1), only constant space is used.
    
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        let ans = check(A[0], B, A)
        if ans != -1 || A[0] == B[0] { return ans }
        return check(B[0], B, A)
    }


    private func check(_ x: Int, _ A: [Int], _ B: [Int]) -> Int {
        var ansA = 0
        var ansB = 0

        for i in 0..<A.count {
            guard A[i] == x || B[i] == x else { return -1 }

            if A[i] != x { ansA += 1 } 
            else if B[i] != x { ansB += 1 }
        }

        return min(ansA, ansB)
    }

}