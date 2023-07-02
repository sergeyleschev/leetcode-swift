class Solution {

    // Solution by Sergey Leschev

    // 728. Self Dividing Numbers
    // A self-dividing number is a number that is divisible by every digit it contains.
    // For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
    // A self-dividing number is not allowed to contain the digit zero.
    // Given two integers left and right, return a list of all the self-dividing numbers in the range [left, right].

    // Example 1:
    // Input: left = 1, right = 22
    // Output: [1,2,3,4,5,6,7,8,9,11,12,15,22]

    // Example 2:
    // Input: left = 47, right = 85
    // Output: [48,55,66,77]

    // Constraints:
    // 1 <= left <= right <= 10^4

    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var ans = (0..<10).map { $0 }
        guard right > 10 else { return Array(ans[left...min(9, right)]) }

        ans.removeSubrange(Range(NSRange(location: 0, length: min(10, left)))!)
        for num in max(11, left)...right {
            let divide = Array("\(num)")
            var isSelfDividing = true
            for n in divide {
                if n == "0" || num % Int(String(n))! != 0 {
                    isSelfDividing = false
                    break
                }
            }
            if isSelfDividing {
                ans.append(num)
            }
        }

        return ans
    }

}
