class Solution {

    // Solution by Sergey Leschev
    // 2729. Check if The Number is Fascinating

    func isFascinating(_ n: Int) -> Bool {
        let concatenatedString = "\(n)\(2 * n)\(3 * n)"
        let uniqueDigits = Set(concatenatedString)
        return uniqueDigits.count == 9 && concatenatedString.count == 9
            && !uniqueDigits.contains("0")
    }
}
