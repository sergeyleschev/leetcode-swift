class Solution {

    // Solution by Sergey Leschev
    // 2508. Add Edges to Make Degrees of All Nodes Even

    func isPossible(_ n: Int, _ edges: [[Int]]) -> Bool {
        var G = Array(repeating: Set<Int>(), count: n)

        for edge in edges {
            let i = edge[0] - 1
            let j = edge[1] - 1
            G[i].insert(j)
            G[j].insert(i)
        }

        let odd = (0..<n).filter { G[$0].count % 2 != 0 }

        func f(_ a: Int, _ b: Int) -> Bool {
            return !G[b].contains(a)
        }

        if odd.count == 2 {
            let a = odd[0]
            let b = odd[1]
            return (0..<n).contains { f(a, $0) && f(b, $0) }
        }

        if odd.count == 4 {
            let a = odd[0]
            let b = odd[1]
            let c = odd[2]
            let d = odd[3]

            return f(a, b) && f(c, d) || f(a, c) && f(b, d) || f(a, d) && f(c, b)
        }

        return odd.isEmpty
    }
}
