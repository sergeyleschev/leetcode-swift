class Solution {

    // Solution by Sergey Leschev

    // 1319. Number of Operations to Make Network Connected
    // There are n computers numbered from 0 to n-1 connected by ethernet cables connections forming a network where connections[i] = [a, b] represents a connection between computers a and b. Any computer can reach any other computer directly or indirectly through the network.
    // Given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected. Return the minimum number of times you need to do this in order to make all the computers connected. If it's not possible, return -1. 

    // Example 1:
    // Input: n = 4, connections = [[0,1],[0,2],[1,2]]
    // Output: 1
    // Explanation: Remove cable between computer 1 and 2 and place between computers 1 and 3.

    // Example 2:
    // Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]
    // Output: 2

    // Example 3:
    // Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2]]
    // Output: -1
    // Explanation: There are not enough cables.

    // Example 4:
    // Input: n = 5, connections = [[0,1],[0,2],[3,4],[2,3]]
    // Output: 0

    // Constraints:
    // 1 <= n <= 10^5
    // 1 <= connections.length <= min(n*(n-1)/2, 10^5)
    // connections[i].length == 2
    // 0 <= connections[i][0], connections[i][1] < n
    // connections[i][0] != connections[i][1]
    // There are no repeated connections.
    // No two computers are connected by more than one cable.

    private class Union {
        private var union: [Int]
        

        init(_ n: Int) {
            union = []
            for i in 0..<n { union.append(i) }
        }
        
        func find (_ i: Int) -> Int {
            if union[i] != i { union[i] = find(union[i]) }
            return union[i]
        }
        
        func unit(_ i1: Int, _ i2: Int) -> Bool {
            if find(i1) == find(i2) { return false }
            union[find(i1)] = find(i2)
            return true
        }
    
    }
    
    
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        guard n > 1 else { return 0 }
        let union = Union(n)
        var overflow = 0
        var ans = 0
        
        for connection in connections {
            let res = union.unit(connection[0], connection[1])
            if !res { overflow += 1 }
        }
        
        for i in 1..<n {
            if union.find(i) == union.find(i - 1) { continue }
            if overflow == 0 { return -1 }
            union.unit(i, i - 1)
            overflow -= 1
            ans += 1
        }
        
        return ans
    }
    
}