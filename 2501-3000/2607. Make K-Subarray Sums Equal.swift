class Solution {

    // Solution by Sergey Leschev
    // 2607. Make K-Subarray Sums Equal

    func makeSubKSumEqual(_ arr: [Int], _ k: Int) -> Int {
        var arrCopy = arr  // Create a mutable copy of the array
        var res: Int = 0
        for i in 0..<k {
            var cycle = [Int]()
            var j = i
            while arrCopy[j] != 0 {
                cycle.append(arrCopy[j])
                arrCopy[j] = 0
                j = (j + k) % arrCopy.count
            }
            cycle.sort()
            for n in cycle {
                res += abs(n - cycle[cycle.count / 2])
            }
        }
        return res
    }
}
