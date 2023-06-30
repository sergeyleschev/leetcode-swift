class Solution {

    // Solution by Sergey Leschev

    // 805. Split Array With Same Average
    // You are given an integer array nums.
    // You should move each element of nums into one of the two arrays A and B such that A and B are non-empty, and average(A) == average(B).
    // Return true if it is possible to achieve that and false otherwise.
    // Note that for an array arr, average(arr) is the sum of all the elements of arr over the length of arr.

    // Example 1:
    // Input: nums = [1,2,3,4,5,6,7,8]
    // Output: true
    // Explanation: We can split the array into [1,4,5,8] and [2,3,6,7], and both of them have an average of 4.5.

    // Example 2:
    // Input: nums = [3,1]
    // Output: false

    // Constraints:
    // 1 <= nums.length <= 30
    // 0 <= nums[i] <= 10^4

    private struct State: Hashable {
        var cnt: Int
        var sum: Double
    }


    func splitArraySameAverage(_ A: [Int]) -> Bool {
        guard A.count > 2 else { return A.count < 2 ? false : A[0] == A[1] }
        let A2Double = A.map { Double($0) }
        let average: Double = Double(A.reduce(0, { $0 + $1 })) / Double(A.count)
        var states = Set<State>()
        states.insert(Solution.State(cnt: 0, sum: 0))
        
        for i in 0..<A.count {
            var nextLevel = states
            for state in states {
                let nextstate = State(cnt: state.cnt + 1, sum: state.sum + A2Double[i])
                guard nextstate.sum / Double(nextstate.cnt) != average else { return nextstate.cnt != A.count }
                nextLevel.insert(nextstate)
            }
            states = nextLevel
        }
        
        return false
    }

}