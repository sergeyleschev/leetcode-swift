class Solution {

    // Solution by Sergey Leschev
    // 2961. Double Modular Exponentiation

    func getGoodIndices(_ variables: [[Int]], _ target: Int) -> [Int] {
        var result: [Int] = []

        func power(_ b: Int, _ p: Int, _ m: Int) -> Int {
            if p <= 0 {
                return 1
            }
            var t = power(b, p / 2, m)
            t = ((t * t) % m)
            return (p % 2 == 1) ? (t * b) % m : t
        }

        for i in 0..<variables.count {
            let a = variables[i][0] % 10
            let b = variables[i][1]
            let c = variables[i][2]
            let m = variables[i][3]

            var t = power(a, b, 10)
            t = power(t, c, m)

            if t == target {
                result.append(i)
            }
        }

        return result
    }
}
