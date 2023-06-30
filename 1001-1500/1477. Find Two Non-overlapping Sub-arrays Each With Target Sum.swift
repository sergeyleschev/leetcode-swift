class Solution {

    // Solution by Sergey Leschev

    // 1477. Find Two Non-overlapping Sub-arrays Each With Target Sum
    // Given an array of integers arr and an integer target.
    // You have to find two non-overlapping sub-arrays of arr each with a sum equal target. There can be multiple answers so you have to find an answer where the sum of the lengths of the two sub-arrays is minimum.

    // Return the minimum sum of the lengths of the two required sub-arrays, or return -1 if you cannot find such two sub-arrays.

    // Example 1:
    // Input: arr = [3,2,2,4,3], target = 3
    // Output: 2
    // Explanation: Only two sub-arrays have sum = 3 ([3] and [3]). The sum of their lengths is 2.

    // Example 2:
    // Input: arr = [7,3,4,7], target = 7
    // Output: 2
    // Explanation: Although we have three non-overlapping sub-arrays of sum = 7 ([7], [3,4] and [7]), but we will choose the first and third sub-arrays as the sum of their lengths is 2.

    // Example 3:
    // Input: arr = [4,3,2,6,2,3,4], target = 6
    // Output: -1
    // Explanation: We have only one sub-array of sum = 6.

    // Example 4:
    // Input: arr = [5,5,4,4,5], target = 3
    // Output: -1
    // Explanation: We cannot find a sub-array of sum = 3.

    // Example 5:
    // Input: arr = [3,1,1,1,5,1,2,1], target = 3
    // Output: 3
    // Explanation: Note that sub-arrays [1,2] and [2,1] cannot be an answer because they overlap.

    // Constraints:
    // 1 <= arr.length <= 10^5
    // 1 <= arr[i] <= 1000
    // 1 <= target <= 10^8

    private typealias Indices = (from: Int, to: Int)
    private typealias PairIndices = (left: Indices?, right: Indices?)
    

    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        guard arr.count > 2 else { return arr.count == 2 ? (arr[0] == target && arr[1] == target ? 2 : -1) : -1 }
        let total = arr.reduce(0) { $0 + $1 }
        guard total >= target * 2 else { return -1 }
        var prefix = [0: -1]
        var sum = 0
        let N = arr.count
        var map = [Int: PairIndices]()
        var pairs = [(Int, Int )] ( )

        for i in 0..<N {
            sum += arr[i]
            let remain = -target + sum
            if let index = prefix[remain] {
                let l = i - index
                if nil == map[l] {
                    map[l] = ((index + 1, i),(index + 1,i))
                } else {
                    map[l]?.right = (index + 1, i)
                }
            }
            prefix[sum] = i
        }

        guard !map.isEmpty else { return -1 }
        let exisitLengths = map.keys.sorted()
        let m = exisitLengths.count
        
        for i in 0...(m - 1) {
            for j in i..<m { pairs.append((i,j)) }

        }
        let sortedPairs = pairs.sorted { (pair1, pair2) -> Bool in
            exisitLengths[pair1.0] + exisitLengths[pair1.1] < exisitLengths[pair2.0] + exisitLengths[pair2.1]
        }

        for pair in sortedPairs {
            guard let pairIndices1 = map[exisitLengths[pair.0]] else { continue }
            guard let pairIndices2 = map[exisitLengths[pair.1]] else { continue }
            
            if let l = pairIndices1.left, let r  = pairIndices2.right, l.to < r.from {
                return exisitLengths[pair.0] + exisitLengths[pair.1]
            }
            
            if let l = pairIndices2.left, let r  = pairIndices1.right, l.to < r.from {
                return exisitLengths[pair.0] + exisitLengths[pair.1]
            }
        }
        
        return -1
    }

}