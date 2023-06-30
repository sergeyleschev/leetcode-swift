class Solution {

    // Solution by Sergey Leschev

    // 749. Contain Virus
    // A virus is spreading rapidly, and your task is to quarantine the infected area by installing walls.
    // The world is modeled as an m x n binary grid isInfected, where isInfected[i][j] == 0 represents uninfected cells, and isInfected[i][j] == 1 represents cells contaminated with the virus. A wall (and only one wall) can be installed between any two 4-directionally adjacent cells, on the shared boundary.
    // Every night, the virus spreads to all neighboring cells in all four directions unless blocked by a wall. Resources are limited. Each day, you can install walls around only one region (i.e., the affected area (continuous block of infected cells) that threatens the most uninfected cells the following night). There will never be a tie.
    // Return the number of walls used to quarantine all the infected regions. If the world will become fully infected, return the number of walls used.

    // Example 1:
    // Input: isInfected = [[0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,1],[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0]]
    // Output: 10
    // Explanation: There are 2 contaminated regions.
    // On the first day, add 5 walls to quarantine the viral region on the left. The board after the virus spreads is:
    // On the second day, add 5 walls to quarantine the viral region on the right. The virus is fully contained.

    // Example 2:
    // Input: isInfected = [[1,1,1],[1,0,1],[1,1,1]]
    // Output: 4
    // Explanation: Even though there is only one cell saved, there are 4 walls built.
    // Notice that walls are only built on the shared boundary of two different cells.

    // Example 3:
    // Input: isInfected = [[1,1,1,0,0,0,0,0,0],[1,0,1,0,1,1,1,1,1],[1,1,1,0,0,0,0,0,0]]
    // Output: 13
    // Explanation: The region on the left only builds two new walls.

    // Constraints:
    // m == isInfected.length
    // n == isInfected[i].length
    // 1 <= m, n <= 50
    // isInfected[i][j] is either 0 or 1.
    // There is always a contiguous viral region throughout the described process that will infect strictly more uncontaminated squares in the next round.

    private struct InfectedZone {
        var infected: Set<Int>
        var willBeInfected: Set<Int>
        var needWalls: Int
    }
    
    
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    

    func containVirus(_ grid: [[Int]]) -> Int {    
        let M = grid.count
        let N = grid[0].count
        var gridCopy = grid
        var totalWalls = 0        
        var infected = Set<Int>()
        var blocked = Set<Int>()
        var varius = [Int:InfectedZone]() //key: infected source value: varius

        
        func valid(_ x: Int, _ y: Int) -> Bool { x < M && x >= 0 && y >= 0 && y < N }
        

        func dfs(currentPosition: Int, source: Int) {
            for index in 0..<4 {
                let nextX = currentPosition >> 8 + dx[index]
                let nextY = currentPosition & 0xff + dy[index]
                if valid(nextX, nextY) {
                    let p = nextX << 8 | nextY
                    if gridCopy[nextX][nextY] == 0 {
                        varius[source]?.willBeInfected.insert(p)
                        varius[source]?.needWalls += 1
                    }
                    if gridCopy[nextX][nextY] == 1 && !infected.contains(p) && !blocked.contains(p){
                        infected.insert(p)
                        varius[source]?.infected.insert(p)
                        dfs(currentPosition: p, source: source)
                    }
                }
            }
        }
        

        while true {            
            varius = [:]
            infected = []
            var infectedCount = 0

            for r in 0..<M {
                for c in 0..<N {
                    if gridCopy[r][c] == 1 {
                        infectedCount += 1
                        let source = r << 8 | c
                        if !infected.contains(source) && !blocked.contains(source) {
                            infected.insert(source)
                            varius[source] = InfectedZone(infected: [source], willBeInfected: [], needWalls: 0)
                            dfs(currentPosition: source, source: source)
                        }
                    }
                }
            }
            
            if varius.isEmpty || infectedCount == M * N { break }
            if varius.count == 1 { totalWalls += (varius.first?.value.needWalls ?? 0); break }
            let sortedVarius = varius.sorted { (varius1, varius2) -> Bool in
                varius1.value.willBeInfected.count > varius2.value.willBeInfected.count
            }
            totalWalls += sortedVarius[0].value.needWalls
            blocked = blocked.union(sortedVarius[0].value.infected)
            for index in 1..<sortedVarius.count {
                for nxt in sortedVarius[index].value.willBeInfected {
                    gridCopy[nxt >> 8][nxt & 0xff] = 1
                }
            }
        }

        return totalWalls
    }

}