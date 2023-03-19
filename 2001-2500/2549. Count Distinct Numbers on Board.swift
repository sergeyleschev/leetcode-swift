class Solution {

    // Solution @ Sergey Leschev

    func distinctIntegers(_ n: Int) -> Int {
        var board = Set<Int>()
        board.insert(n)
        var prevNumbers = [n]
        for _ in 1...Int(1e9) {
            var newNumbers = Set<Int>()
            for x in prevNumbers {
                for i in stride(from: 1, through: n, by: x % 2 == 0 ? 2 : 1) {
                    if x % i == 1 {
                        newNumbers.insert(i)
                    }
                }
            }
            if newNumbers.isEmpty {
                break // no new numbers to add
            }
            prevNumbers = Array(newNumbers)
            board.formUnion(newNumbers)
        }
        return board.count
    }
}
