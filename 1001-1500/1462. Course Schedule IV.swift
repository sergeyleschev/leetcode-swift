class Solution {

    // Solution @ Sergey Leschev

    // 1462. Course Schedule IV
    // There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course ai first if you want to take course bi.
    // For example, the pair [0, 1] indicates that you have to take course 0 before you can take course 1.
    // Prerequisites can also be indirect. If course a is a prerequisite of course b, and course b is a prerequisite of course c, then course a is a prerequisite of course c.
    // You are also given an array queries where queries[j] = [uj, vj]. For the jth query, you should answer whether course uj is a prerequisite of course vj or not.

    // Return a boolean array answer, where answer[j] is the answer to the jth query.

    // Example 1:
    // Input: numCourses = 2, prerequisites = [[1,0]], queries = [[0,1],[1,0]]
    // Output: [false,true]
    // Explanation: The pair [1, 0] indicates that you have to take course 1 before you can take course 0.
    // Course 0 is not a prerequisite of course 1, but the opposite is true.

    // Example 2:
    // Input: numCourses = 2, prerequisites = [], queries = [[1,0],[0,1]]
    // Output: [false,false]
    // Explanation: There are no prerequisites, and each course is independent.

    // Example 3:
    // Input: numCourses = 3, prerequisites = [[1,2],[1,0],[2,0]], queries = [[1,0],[1,2]]
    // Output: [true,true]

    // Constraints:
    // 2 <= numCourses <= 100
    // 0 <= prerequisites.length <= (numCourses * (numCourses - 1) / 2)
    // prerequisites[i].length == 2
    // 0 <= ai, bi <= n - 1
    // ai != bi
    // All the pairs [ai, bi] are unique.
    // The prerequisites graph has no cycles.
    // 1 <= queries.length <= 10^4
    // 0 <= ui, vi <= n - 1
    // ui != vi

    func checkIfPrerequisite(_ n: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        guard n > 0 else { return [] }
        var edges: [[Int]] = Array(repeating: [], count: n)
        var res = Set<String>()
        var ans: [Bool] = []
        
        for info in prerequisites { edges[info.first!].append(info.last!) }
        for i in 0 ..< n { bfs(edges: edges, i: i, n: n, res: &res) }
        for query in queries { ans.append(res.contains("\(query.first!)->\(query.last!)")) }
        
        return ans
    }
    

    func bfs(edges: [[Int]], i: Int, n: Int, res: inout Set<String>) {
        guard i < edges.count else { return }
        var visited: [Bool] = Array(repeating: false, count: n)
        var queue: [Int] = []
        
        queue.append(i)
        visited[i] = true
        
        while !queue.isEmpty {
            let u = queue.removeFirst()
            let children = edges[u]
            for child in children {
                if !visited[child] {
                    queue.append(child)
                    visited[child] = true
                    res.insert("\(i)->\(child)")
                }
            }
        }
    }

}