class Solution {

    // Solution by Sergey Leschev
    // 2681. Power of Heroes

    func sumOfPower(_ nums: [Int]) -> Int {
        var res: Int64 = 0
        var s: Int64 = 0
        let base: Int64 = 1_000_000_007
        let sortedNums = nums.sorted()

        for x in sortedNums {
            res = (res + (s + Int64(x)) * Int64(x) % base * Int64(x) % base) % base
            s = (s * 2 + Int64(x)) % base
        }

        return Int(res)
    }
}
