class Solution {

    // Solution by Sergey Leschev
    // 2661. First Completely Painted Row or Column

    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        var mpr = [Int: Int]()
        var mpc = [Int: Int]()
        var mprc = [Int: Int]()
        var mpcc = [Int: Int]()

        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                mpr[mat[i][j]] = i
                mpc[mat[i][j]] = j
            }
        }

        for i in 0..<arr.count {
            let n = arr[i]
            mprc[mpr[n]!, default: 0] += 1
            mpcc[mpc[n]!, default: 0] += 1

            if mprc[mpr[n]!, default: 0] == mat[0].count || mpcc[mpc[n]!, default: 0] == mat.count {
                return i
            }
        }

        return -1
    }
}
