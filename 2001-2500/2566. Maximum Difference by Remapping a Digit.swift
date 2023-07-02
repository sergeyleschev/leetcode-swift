class Solution {

    // Solution by Sergey Leschev

    func minMaxDifference(_ num: Int) -> Int {
        var minNum = num
        var maxNum = num

        // Convert num to an array of digits
        var digits = Array(String(num)).map { Int(String($0))! }

        // Try all possible digit replacements
        for i in 0...9 {
            for j in 0...9 {
                // Replace digit i with digit j
                let newDigits = digits.map { $0 == i ? j : $0 }

                // Convert the array of digits back to a number
                let newNum = newDigits.reduce(0) { $0 * 10 + $1 }

                // Update minNum and maxNum if necessary
                if newNum < minNum {
                    minNum = newNum
                }
                if newNum > maxNum {
                    maxNum = newNum
                }
            }
        }

        return maxNum - minNum
    }
}
