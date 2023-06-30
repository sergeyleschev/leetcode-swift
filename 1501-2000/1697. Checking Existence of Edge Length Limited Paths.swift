// Solution by Sergey Leschev

class UnionFind {
    private var parent: [Int]
    
    init(_ n: Int) {
        parent = Array(0..<n)
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        parent[find(x)] = find(y)
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}

class Solution {
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var indices = Array(0..<queries.count)
        indices.sort { queries[$0][2] < queries[$1][2] }
        var edgeList = edgeList.sorted(by: { $0[2] < $1[2] })
        
        var ans = [Bool](repeating: false, count: queries.count)
        var i = 0
        let uf = UnionFind(n)
        
        for j in indices {
            let (u, v, limit) = (queries[j][0], queries[j][1], queries[j][2])
            while i < edgeList.count && edgeList[i][2] < limit {
                uf.union(edgeList[i][0], edgeList[i][1])
                i += 1
            }
            ans[j] = uf.connected(u, v)
        }
        
        return ans
    }
}
