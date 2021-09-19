class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1718. Construct the Lexicographically Largest Valid Sequence
    // Given an integer n, find a sequence that satisfies all of the following:
    // The integer 1 occurs once in the sequence.
    // Each integer between 2 and n occurs twice in the sequence.
    // For every integer i between 2 and n, the distance between the two occurrences of i is exactly i.
    // The distance between two numbers on the sequence, a[i] and a[j], is the absolute difference of their indices, |j - i|.

    // Return the lexicographically largest sequence. It is guaranteed that under the given constraints, there is always a solution.

    // A sequence a is lexicographically larger than a sequence b (of the same length) if in the first position where a and b differ, sequence a has a number greater than the corresponding number in b. For example, [0,1,9,0] is lexicographically larger than [0,1,5,6] because the first position they differ is at the third number, and 9 is greater than 5.

    // Example 1:
    // Input: n = 3
    // Output: [3,1,2,3,2]
    // Explanation: [2,3,2,1,3] is also a valid sequence, but [3,1,2,3,2] is the lexicographically largest valid sequence.

    // Example 2:
    // Input: n = 5
    // Output: [5,3,1,4,3,5,2,4,2]

    // Constraints:
    // 1 <= n <= 20

    func constructDistancedSequence(_ n: Int) -> [Int] {
        let N = 2 * n - 1
        var ans = [Int](repeating: 0, count: N)
        var visited = [Bool](repeating: false, count: n + 1)
        
        func backtracking(_ curIndex: Int) -> Bool {
            guard curIndex != N else { return true }
            if ans[curIndex] != 0 { return backtracking(curIndex + 1) }
            
            for i in stride(from: n, to: 0, by: -1) {
                guard !visited[i] else { continue }
                if i == 1 {
                    ans[curIndex] = 1
                    visited[i] = true
                    guard !backtracking(curIndex + 1) else { return true }
                    visited[i] = false
                    ans[curIndex] = 0
                } else {
                    guard curIndex + i < N && ans[curIndex + i] == 0 else { continue }
                    ans[curIndex] = i
                    ans[curIndex + i] = i
                    visited[i] = true
                    guard !backtracking(curIndex + 1) else { return true }
                    ans[curIndex] = 0
                    ans[curIndex + i] = 0
                    visited[i] = false
                }
                
            }
            return false
        }
        
        backtracking(0)
        return ans
    }

}