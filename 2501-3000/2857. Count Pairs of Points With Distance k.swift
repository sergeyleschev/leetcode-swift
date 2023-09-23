class Solution {

    // Solution by Sergey Leschev
    // 2857. Count Pairs of Points With Distance k
    // O(n)

    func countPairs(_ coordinates: [[Int]], _ k: Int) -> Int {
        var result = 0
        var seen = [String: Int]()

        for point in coordinates {
            let x = point[0]
            let y = point[1]

            for split in 0...k {
                let xComplement = x ^ split
                let yComplement = y ^ (k - split)

                let key = "\(xComplement),\(yComplement)"
                result += seen[key] ?? 0
            }

            let key = "\(x),\(y)"
            seen[key] = (seen[key] ?? 0) + 1
        }

        return result
    }
}
