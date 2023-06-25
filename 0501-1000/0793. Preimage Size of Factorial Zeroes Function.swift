class Solution {

    // Solution @ Sergey Leschev

    // 793. Preimage Size of Factorial Zeroes Function
    // Let f(x) be the number of zeroes at the end of x!. (Recall that x! = 1 * 2 * 3 * ... * x, and by convention, 0! = 1.)
    // For example, f(3) = 0 because 3! = 6 has no zeroes at the end, while f(11) = 2 because 11! = 39916800 has 2 zeroes at the end. Given k, find how many non-negative integers x have the property that f(x) = k.

    // Example 1:
    // Input: k = 0
    // Output: 5
    // Explanation: 0!, 1!, 2!, 3!, and 4! end with k = 0 zeroes.

    // Example 2:
    // Input: k = 5
    // Output: 0
    // Explanation: There is no x such that x! ends in k = 5 zeroes.
    // Note:
    // k will be an integer in the range [0, 109].

    func preimageSizeFZF(_ K: Int) -> Int { rightBound(target: K) - leftBound(target: K) + 1 }
    
    
    func leftBound(target: Int) -> Int {
        var low = 0
        var high = Int.max
        while low < high {
            let middle = low + (high - low) / 2
            if trailingZeroes(number: middle) < target {
                low = middle + 1
            } else if trailingZeroes(number: middle) > target {
                high = middle
            } else {
                high = middle
            }
        }
        return low
    }
    

    func rightBound(target: Int) -> Int {
        var low = 0
        var high = Int.max
        while low < high {
            let middle = low + (high - low) / 2
            if trailingZeroes(number: middle) < target {
                low = middle + 1
            } else if trailingZeroes(number: middle) > target {
                high = middle
            } else {
                low = middle + 1
            }
        }
        return low - 1
    }
    

    func trailingZeroes(number: Int) -> Int {
        var result = 0
        var divisor = 5
        while divisor <= number {
            result += number / divisor
            divisor *= 5
        }
        return result
    }

}