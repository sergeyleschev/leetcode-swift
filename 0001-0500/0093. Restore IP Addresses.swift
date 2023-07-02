class Solution {

    // Solution by Sergey Leschev

    // 93. Restore IP Addresses
    // Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.
    // A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses.

    // Example 1:
    // Input: s = "25525511135"
    // Output: ["255.255.11.135","255.255.111.35"]

    // Example 2:
    // Input: s = "0000"
    // Output: ["0.0.0.0"]

    // Example 3:
    // Input: s = "1111"
    // Output: ["1.1.1.1"]

    // Example 4:
    // Input: s = "010010"
    // Output: ["0.10.0.10","0.100.1.0"]

    // Example 5:
    // Input: s = "101023"
    // Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]

    // Constraints:
    // 0 <= s.length <= 3000
    // s consists of digits only.

    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count > 12 || s.count < 4 { return [] }

        var chars = Array(s)
        var res: [String] = []

        func backtarck(_ path: [Int], _ length: Int) {
            if path.count == 4 {
                if length == chars.count {
                    var string = ""
                    for (i, c) in chars.enumerated() {
                        string += String(c)
                        if i < length - 1 && path.contains(i + 1) {
                            string += "."
                        }
                    }
                    res.append(string)
                }
                return
            }

            var path = path
            for i in 1..<4 {
                if i + length > chars.count { break }

                if i >= 2 {
                    if Int(String(chars[length]))! == 0 { break }
                }

                if i == 3 {
                    if Int(
                        String(chars[length]) + String(chars[length + 1])
                            + String(chars[length + 2]))! > 255
                    {
                        break
                    }
                }

                path.append(length + i)
                backtarck(path, length + i)
                path.remove(at: path.count - 1)
            }
        }

        backtarck([], 0)
        return res
    }

}
