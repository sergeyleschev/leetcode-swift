import Foundation

class Solution {

    // Solution by Sergey Leschev
    // 2910. Minimum Number of Groups to Create a Valid Assignment

    func minGroupsForValidAssignment(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        for num in nums {
            counts[num, default: 0] += 1
        }

        let frequencies = counts.values
        if frequencies.count == 1 {
            return 1
        }

        var result = nums.count  // worst case is all nums are unique
        let leastFrequent = frequencies.min()!

        for partitionSize in 1...leastFrequent {
            result = min(result, partition(partitionSize, frequencies: Array(frequencies)))
        }

        return result
    }

    private func partition(_ guessedPartitionSize: Int, frequencies: [Int]) -> Int {
        var result = 0
        for frequency in frequencies {
            let numGroups = frequency / guessedPartitionSize
            let remainder = frequency % guessedPartitionSize
            if remainder > numGroups {
                return Int.max
            }

            result += Int(ceil(Double(frequency) / Double(guessedPartitionSize + 1)))
        }
        return result
    }
}
