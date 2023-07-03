class Solution {

    // Solution by Sergey Leschev
    // 2573. Find the String with LCP

    func findTheString(_ lcp: [[Int]]) -> String {
        let n = lcp.count
        var A = Array(repeating: 0, count: n)
        var c = 1

        for i in 0..<n {
            if A[i] != 0 { continue }
            if c > 26 { return "" }

            for j in i..<n {
                if lcp[i][j] != 0 {
                    A[j] = c
                }
            }
            c += 1
        }

        for i in 0..<n {
            for j in 0..<n {
                let v = (i + 1 < n && j + 1 < n) ? lcp[i + 1][j + 1] : 0
                let value = (A[i] == A[j]) ? v + 1 : 0

                if lcp[i][j] != value {
                    return ""
                }
            }
        }

        var result = ""
        for i in A {
            let character = Character(UnicodeScalar(UInt8(i) + UInt8(97) - 1))
            result.append(character)
        }

        return result
    }
}
