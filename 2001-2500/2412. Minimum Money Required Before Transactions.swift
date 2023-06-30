class Solution {

    // Solution by Sergey Leschev
    // 2412. Minimum Money Required Before Transactions

    func minimumMoney(_ transactions: [[Int]]) -> Int {
        func compare1(_ a: [Int], _ b: [Int]) -> Bool {
            let opt1 = min(-a[0], -a[0] + a[1] - b[0])
            let opt2 = min(-b[0], -b[0] + b[1] - a[0])
            
            if opt1 < opt2 { return true }
            if opt1 > opt2 { return false }
            
            return a[0] > b[0]
        }
        
        func canSolve(_ A: [[Int]], _ mid: Int) -> Bool {
            var money = mid
            for i in 0..<A.count {
                if money < A[i][0] { return false }
                money = money - A[i][0] + A[i][1]
            }
            return true
        }
        
        func solve(_ A: [[Int]]) -> Int {
            var start = 0
            var end = Int.max
            
            while start < end {
                if end - start == 1 { break }
                
                let mid = start + (end - start) / 2
                
                if canSolve(A, mid) {
                    end = mid
                } else {
                    start = mid
                }
            }
            
            if canSolve(A, start) { return start }
            
            return end
        }
        
        var answer = Int.min
        var sortedTransactions = transactions
        sortedTransactions.sort(by: compare1)
        answer = max(answer, solve(sortedTransactions))
        
        return answer
    }
}
