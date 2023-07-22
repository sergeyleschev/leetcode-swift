class Solution {

    // Solution by Sergey Leschev
    // 2766. Relocate Marbles

    func relocateMarbles(_ nums: [Int], _ moveFrom: [Int], _ moveTo: [Int]) -> [Int] {
        var s = Set(nums)
        for (from, to) in zip(moveFrom, moveTo) {
            s.remove(from)
            s.insert(to)
        }
        return s.sorted()
    }
}
