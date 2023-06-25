class Solution {

    // Solution @ Sergey Leschev

    // 207. Course Schedule
    // There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
    // For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
    // Return true if you can finish all courses. Otherwise, return false.

    // Example 1:
    // Input: numCourses = 2, prerequisites = [[1,0]]
    // Output: true
    // Explanation: There are a total of 2 courses to take. 
    // To take course 1 you should have finished course 0. So it is possible.

    // Example 2:
    // Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
    // Output: false
    // Explanation: There are a total of 2 courses to take. 
    // To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
     
    // Constraints:
    // 1 <= numCourses <= 10^5
    // 0 <= prerequisites.length <= 5000
    // prerequisites[i].length == 2
    // 0 <= ai, bi < numCourses
    // All the pairs prerequisites[i] are unique.

    // - Approach: BFS Topological Sorting    

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var neighbors: [[Int]] = Array(repeating: [], count: numCourses) // Array to keep tracking neighbors of course
        var degreeOfCourses: [Int] = Array(repeating: 0, count: numCourses) // Array to keep tracking prerequisites courses count of course
        var queue: [Int] = []
        var count: Int = 0

        for pre in prerequisites {
            let preCourse = pre[1]
            let course = pre[0]
            neighbors[preCourse].append(course)
            degreeOfCourses[course] += 1
        }

        for course in 0..<degreeOfCourses.count {
            if degreeOfCourses[course] == 0 {
                queue.append(course)
            }
        }

        while !queue.isEmpty {
            let course = queue.removeFirst()
            for c in neighbors[course] {
                degreeOfCourses[c] -= 1
                if degreeOfCourses[c] == 0 {
                    queue.append(c)
                }
            }
        }

        for d in degreeOfCourses { if d > 0 { return false } }
        return true
    }

}