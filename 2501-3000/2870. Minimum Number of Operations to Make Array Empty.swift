class Solution {

    // Solution by Sergey Leschev
    // 2870. Minimum Number of Operations to Make Array Empty

    func minOperations(_ nums: [Int]) -> Int {
        var countDict = [Int: Int]()

        // Count the occurrences of each element
        for num in nums {
            countDict[num, default: 0] += 1
        }

        // Check if there's any element with a count of 1
        if countDict.values.min() == 1 {
            return -1
        }

        var totalOperations = 0
        for count in countDict.values {
            // Calculate the operations needed for each count
            totalOperations += count / 3 + (count % 3 > 0 ? 1 : 0)
        }

        return totalOperations
    }
}
