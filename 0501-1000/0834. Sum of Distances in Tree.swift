class Solution {

    // Solution by Sergey Leschev

    // 834. Sum of Distances in Tree
    // An undirected, connected tree with n nodes labelled 0...n-1 and n-1 edges are given.
    // The ith edge connects nodes edges[i][0] and edges[i][1] together.
    // Return a list ans, where ans[i] is the sum of the distances between node i and all other nodes.

    // Example 1:
    // Input: n = 6, edges = [[0,1],[0,2],[2,3],[2,4],[2,5]]
    // Output: [8,12,6,10,10,10]
    // Explanation:
    // Here is a diagram of the given tree:
    //   0
    //  / \
    // 1   2
    //    /|\
    //   3 4 5
    // We can see that dist(0,1) + dist(0,2) + dist(0,3) + dist(0,4) + dist(0,5)
    // equals 1 + 1 + 2 + 2 + 2 = 8.  Hence, answer[0] = 8, and so on.
    // Note: 1 <= n <= 10000

    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        var answer = [Int](repeating: 0, count: N)
        var sonNum = [Int](repeating: 0, count: N)
        var table = [Int](repeating: 0, count: N)
        var gragh = [[Int]](repeating: [], count: N)

        for edge in edges {
            gragh[edge[0]].append(edge[1])
            gragh[edge[1]].append(edge[0])
        }

        func countSons(_ u: Int, _ f: Int) {
            sonNum[u] = 1
            table[u] = 0
            for v in gragh[u] {
                if v == f { continue }
                countSons(v, u)
                table[u] += table[v] + sonNum[v]
                sonNum[u] += sonNum[v]
            }
        }

        func transfer(_ u: Int, _ f: Int) {
            answer[u] = table[u]
            for v in gragh[u] {
                if v == f { continue }
                var preU = table[u]
                var preV = table[v]
                var sumU = sonNum[u]
                var sumV = sonNum[v]
                table[u] -= table[v] + sonNum[v]
                sonNum[u] -= sonNum[v]
                table[v] += table[u] + sonNum[u]
                sonNum[v] += sonNum[u]
                transfer(v, u)
                table[u] = preU
                table[v] = preV
                sonNum[u] = sumU
                sonNum[v] = sumV
            }
        }

        countSons(0, -1)
        transfer(0, -1)
        return answer
    }

}
