class Solution {

    // Solution by Sergey Leschev

    // 506. Relative Ranks
    // You are given an integer array score of size n, where score[i] is the score of the ith athlete in a competition. All the scores are guaranteed to be unique.
    // The athletes are placed based on their scores, where the 1st place athlete has the highest score, the 2nd place athlete has the 2nd highest score, and so on. The placement of each athlete determines their rank:
    // The 1st place athlete's rank is "Gold Medal".
    // The 2nd place athlete's rank is "Silver Medal".
    // The 3rd place athlete's rank is "Bronze Medal".
    // For the 4th place to the nth place athlete, their rank is their placement number (i.e., the xth place athlete's rank is "x").
    // Return an array answer of size n where answer[i] is the rank of the ith athlete.

    // Example 1:
    // Input: score = [5,4,3,2,1]
    // Output: ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
    // Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].

    // Example 2:
    // Input: score = [10,3,8,9,4]
    // Output: ["Gold Medal","5","Bronze Medal","Silver Medal","4"]
    // Explanation: The placements are [1st, 5th, 3rd, 2nd, 4th].

    // Constraints:
    // n == score.length
    // 1 <= n <= 10^4
    // 0 <= score[i] <= 10^6
    // All the values in score are unique.

    class Number {
        var num = 0
        var index = 0
    }
    
    
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        var result = [String]()
        var object = [Number]()
        
        for (index, element) in nums.enumerated() {
            result.append("\(element)")
            let number = Number()
            number.index = index
            number.num = element
            object.append(number)
        }

        object = object.sorted(by: { (first, second) -> Bool in first.num < second.num })
        
        for rank in 0..<object.count {
            if rank == nums.count - 1 { result[object[rank].index] = ("Gold Medal"); continue }
            if rank == nums.count - 2 { result[object[rank].index] = ("Silver Medal"); continue }
            if rank == nums.count - 3 { result[object[rank].index] = ("Bronze Medal"); continue }
            result[object[rank].index] = "\(nums.count - rank)"
        }
        
        return result
    }
    
}