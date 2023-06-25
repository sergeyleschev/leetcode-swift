class Solution {

    // Solution @ Sergey Leschev

    // 1291. Sequential Digits
    // An integer has sequential digits if and only if each digit in the number is one more than the previous digit.
    // Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.

    // Finds a sorted list of integers in the range, including only those that have sequential digits.

    // - Parameters:
    //   - low: Lower bound.
    //   - high: Upper bound.
    // - Returns: The sorted list of integers in the range.

    // Example 1:
    // Input: low = 100, high = 300
    // Output: [123,234]

    // Example 2:
    // Input: low = 1000, high = 13000
    // Output: [1234,2345,3456,4567,5678,6789,12345]

    // Constraints:
    // 10 <= low <= high <= 10^9

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    private let seq = Sequential()

    
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var ans = [Int]()

        for num in seq.nums {
            guard num >= low, num <= high else { continue }
            ans.append(num)
        }

        return ans
    }

}


class Sequential {
    var nums = [Int]()

    
    init() {
        let sample: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let n = 10

        for length in 2..<n {
            for start in 0..<(n - length) {
                let n = sample[start..<(start + length)]
                guard let num = Int(String(n)) else { continue }
                nums.append(num)
            }
        }
    }

}