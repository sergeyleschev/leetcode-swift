class Solution {

    // Solution by Sergey Leschev
    // 2974. Minimum Number Game

    func numberGame(_ nums: [Int]) -> [Int] {
        var sortedNums = nums.sorted()
        var arr = [Int]()

        for i in stride(from: 1, to: sortedNums.count, by: 2) {
            sortedNums.swapAt(i, i - 1)
        }

        arr.append(contentsOf: sortedNums)
        return arr
    }
}
