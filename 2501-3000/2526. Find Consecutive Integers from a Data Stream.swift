class DataStream {

    // Solution by Sergey Leschev
    // 2526. Find Consecutive Integers from a Data Stream

    let value: Int
    let k: Int
    var numOccurrences: Int

    init(_ value: Int, _ k: Int) {
        self.value = value
        self.k = k
        self.numOccurrences = 0
    }

    func consec(_ num: Int) -> Bool {
        if num == value {
            numOccurrences += 1
        } else {
            numOccurrences = 0
        }

        return numOccurrences >= k
    }
}

/**
 * Your DataStream object will be instantiated and called as such:
 * let obj = DataStream(value, k)
 * let ret_1: Bool = obj.consec(num)
 */
