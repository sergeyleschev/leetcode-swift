class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1349. Maximum Students Taking Exam
    // Given a m * n matrix seats  that represent seats distributions in a classroom. If a seat is broken, it is denoted by '#' character otherwise it is denoted by a '.' character.
    // Students can see the answers of those sitting next to the left, right, upper left and upper right, but he cannot see the answers of the student sitting directly in front or behind him. Return the maximum number of students that can take the exam together without any cheating being possible..
    // Students must be placed in seats in good condition.

    // Example 1:
    // Input: seats = [["#",".","#","#",".","#"],
    //                 [".","#","#","#","#","."],
    //                 ["#",".","#","#",".","#"]]
    // Output: 4
    // Explanation: Teacher can place 4 students in available seats so they don't cheat on the exam. 

    // Example 2:
    // Input: seats = [[".","#"],
    //                 ["#","#"],
    //                 ["#","."],
    //                 ["#","#"],
    //                 [".","#"]]
    // Output: 3
    // Explanation: Place all students in available seats. 

    // Example 3:
    // Input: seats = [["#",".",".",".","#"],
    //                 [".","#",".","#","."],
    //                 [".",".","#",".","."],
    //                 [".","#",".","#","."],
    //                 ["#",".",".",".","#"]]
    // Output: 10
    // Explanation: Place students in available seats in column 1, 3 and 5.

    // Constraints:
    // seats contains only characters '.' and'#'.
    // m == seats.length
    // n == seats[i].length
    // 1 <= m <= 8
    // 1 <= n <= 8

    private var memo = [Int:Int]()
    private var seats = [[Character]]()
    private var M  = 0
    private var N = 0
    private var stateToStudentNumbers = [Int]()
    private var possibleSatesOfEachRow = [Int]()
    private var lastLevelStateToCurrentLevelstate = [Int:Set<Int>]()
    

    init() {
        self.stateToStudentNumbers = (0...255).map({ countOnes(of: $0)})
        self.possibleSatesOfEachRow = (0...255).filter({ check($0)})
        self.lastLevelStateToCurrentLevelstate = caculatePossibleAdjentStates()
    }
    
    func maxStudents(_ seats: [[Character]]) -> Int {    
        self.seats = seats
        self.M = seats.count
        self.N = seats[0].count
        self.memo = [:]
        let curPossibleStatesOfEachRow = self.possibleSatesOfEachRow.filter { $0 < (1 << N)}
        var possibleStateOfSpecificRow = [[Int]]()
        
        (0..<M).forEach { row in
            possibleStateOfSpecificRow.append(curPossibleStatesOfEachRow.filter({ state in checkBrokenSeats(row, state) }))
        }
        
        return dfs(0, 0, possibleStateOfSpecificRow) ?? 0
    }
    

    private func check(_ state: Int) -> Bool {
        for bit in 0...7 {
            guard (state & (1 << bit)) * (state & (1 << (bit + 1))) == 0 else { return false }
        }
        return true
    }


    private func checkBrokenSeats(_ row: Int, _ state: Int) -> Bool {
        for col in 0..<N {
            guard state & (1 << col) == 0 || self.seats[row][col] != "#" else { return false }
        }
        return true
    }

    
    private func caculatePossibleAdjentStates() -> [Int:Set<Int>] {
        var ans = [Int:Set<Int>]()


        func checkInternal(lastLevelState: Int, currentLevelState: Int) -> Bool {
            guard lastLevelState != currentLevelState else { return true }
            for bit in 0...7 {
                guard  lastLevelState & (1 << bit) != 0 else { continue }
                guard bit - 1 < 0 || currentLevelState & 1 << (bit - 1) == 0 else { return false }
                guard bit + 1 > 7 ||  currentLevelState & 1 << (bit + 1) == 0 else { return false }
            }
            return true
        }
        
        for ls in self.possibleSatesOfEachRow {
            var temp = Set<Int>()
            for cs in self.possibleSatesOfEachRow where checkInternal(lastLevelState: ls, currentLevelState: cs) { temp.insert(cs) }
            ans[ls] = temp
        }

        return ans        
    }


    private func countOnes(of num: Int) -> Int { (0...7).reduce(0) { $0 + (num & (1 << $1) == 0 ? 0 : 1)} }
    

    private func dfs(_ lastLevelState: Int, _ row: Int, _ possibleStatesOfSpecificRow: [[Int]]) -> Int? {
        guard row < M  else { return 0 }
        let key = row << 16 | lastLevelState
        guard nil == memo[key] else { return memo[key]! == -1 ? nil : memo[key] }
        var curMaxStudengtsNumber: Int? = nil
        guard let nextLevelPossibleStates = self.lastLevelStateToCurrentLevelstate[lastLevelState] else { return nil }

        for s in possibleStatesOfSpecificRow[row] {
            guard nextLevelPossibleStates.contains(s) else { continue }
            if let v = dfs(s, row + 1, possibleStatesOfSpecificRow) {
                curMaxStudengtsNumber = max(curMaxStudengtsNumber ?? 0, v + self.stateToStudentNumbers[s])
            }
        }

        guard let v = curMaxStudengtsNumber else { return nil }
        defer { memo[key] = curMaxStudengtsNumber ?? -1 }
        return v
    }

}