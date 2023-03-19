// Solution @ Sergey Leschev

class Solution {
    func evenOddBit(_ n: Int) -> [Int] {
        var even = 0
        var odd = 0
        var num = n
        var i = 0
        while num > 0 {
            if num & 1 == 1 {
                if i % 2 == 0 {
                    even += 1
                } else {
                    odd += 1
                }
            }
            num >>= 1
            i += 1
        }
        return [even, odd]
    }
}