class ATM {

    // Solution by Sergey Leschev
    // 2241. Design an ATM Machine

    var bank = [Int](repeating: 0, count: 5)
    let val = [20, 50, 100, 200, 500]

    init() {

    }

    func deposit(_ banknotesCount: [Int]) {
        for i in 0..<5 {
            bank[i] += banknotesCount[i]
        }
    }

    func withdraw(_ amount: Int) -> [Int] {
        var take = [Int](repeating: 0, count: 5)
        var remainingAmount = amount

        for i in (0..<5).reversed() {
            take[i] = min(bank[i], remainingAmount / val[i])
            remainingAmount -= take[i] * val[i]
        }

        if remainingAmount == 0 {
            for i in 0..<5 {
                bank[i] -= take[i]
            }
            return take
        } else {
            return [-1]
        }
    }
}

/**
 * Your ATM object will be instantiated and called as such:
 * let obj = ATM()
 * obj.deposit(banknotesCount)
 * let ret_2: [Int] = obj.withdraw(amount)
 */
