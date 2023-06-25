class Solution {

    // Solution @ Sergey Leschev

    // 306. Additive Number
    // Additive number is a string whose digits can form additive sequence.
    // A valid additive sequence should contain at least three numbers. Except for the first two numbers, each subsequent number in the sequence must be the sum of the preceding two.
    // Given a string containing only digits '0'-'9', write a function to determine if it's an additive number.
    // Note: Numbers in the additive sequence cannot have leading zeros, so sequence 1, 2, 03 or 1, 02, 3 is invalid.

    // Example 1:
    // Input: "112358"
    // Output: true
    // Explanation: The digits can form an additive sequence: 1, 1, 2, 3, 5, 8. 
    //              1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
    // Example 2:
    // Input: "199100199"
    // Output: true
    // Explanation: The additive sequence is: 1, 99, 100, 199. 
    //              1 + 99 = 100, 99 + 100 = 199
     
    // Constraints:
    // num consists only of digits '0'-'9'.
    // 1 <= num.length <= 35
    // Follow up:
    // How would you handle overflow for very large input integers?

    func isAdditiveNumber(_ num: String) -> Bool {
        let num = Array(num)
        var res = false

        checkHelper(num, 0, &res)
        return res
    }

    
    private func checkHelper(_ num: [Character], _ offset: Int, _ res: inout Bool) {
        var i = offset
        while i < num.count && (i == offset || num[offset] != "0") {
            let first: [Character] = Array(num[offset...i])

            var j = i + 1
            while j < num.count && (j == i+1 || num[i+1] != "0") {
                let second: [Character] = Array(num[i+1...j])
                backtrace(num, j+1, first, second, &res)
                j += 1
            }

            i += 1
        }
    }
    

    private func backtrace(_ num: [Character], _ offset: Int, _ first: [Character], _ second: [Character], _ res: inout Bool) {
        let sum = sumNumberStr(first, second)
        var k = 0
        while k < sum.count && offset + k < num.count {
            if sum[k] == num[offset+k] {
                k += 1
            } else {
                break
            }
        }

        if k == sum.count {
            if offset+k == num.count {
                res = true
                return
            } else {
                backtrace(num, offset + k, second, sum, &res)
            }
        }
    }


    private func sumNumberStr(_ a: [Character], _ b: [Character]) -> [Character] {
        let aLen = a.count
        let bLen = b.count
        if aLen < bLen { return sumNumberStr(b, a) }

        let a = Array(a.reversed())
        let b = Array(b.reversed())

        var carry = 0
        var res: [Character] = Array(repeating: "0", count: a.count)

        var i = 0
        while i < b.count {
            let sum = Int(a[i].asciiValue! + b[i].asciiValue! - 2*Character("0").asciiValue!)
            res[i] = Character(String((sum + carry) % 10))
            carry = (sum + carry) / 10
            i += 1
        }

        while i < a.count {
            let sum = Int(a[i].asciiValue! - Character("0").asciiValue!)
            res[i] = Character(String((sum + carry) % 10))
            carry = (sum + carry) / 10
            i += 1
        }

        if carry > 0 { res.append("1") }
        return res.reversed()
    }

}