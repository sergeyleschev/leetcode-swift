class Solution {

    // Solution by Sergey Leschev

    // 1733. Minimum Number of People to Teach
    // On a social network consisting of m users and some friendships between users, two users can communicate with each other if they know a common language.
    // You are given an integer n, an array languages, and an array friendships where:
    // There are n languages numbered 1 through n,
    // languages[i] is the set of languages the i th user knows, and
    // friendships[i] = [u, v i] denotes a friendship between the users u i and vi.
    // You can choose one language and teach it to some users so that all friends can communicate with each other. Return the minimum number of users you need to teach.
    // Note that friendships are not transitive, meaning if x is a friend of y and y is a friend of z, this doesn't guarantee that x is a friend of z.

    // Example 1:
    // Input: n = 2, languages = [[1],[2],[1,2]], friendships = [[1,2],[1,3],[2,3]]
    // Output: 1
    // Explanation: You can either teach user 1 the second language or user 2 the first language.

    // Example 2:
    // Input: n = 3, languages = [[2],[1,3],[1,2],[3]], friendships = [[1,4],[1,2],[3,4],[2,3]]
    // Output: 2
    // Explanation: Teach the third language to users 1 and 3, yielding two users to teach.
     
    // Constraints:
    // 2 <= n <= 500
    // languages.length == m
    // 1 <= m <= 500
    // 1 <= languages[i].length <= n
    // 1 <= languages[i][j] <= n
    // 1 <= u i < v i <= languages.length
    // 1 <= friendships.length <= 500
    // All tuples (u i, v i) are unique
    // languages[i] contains only unique values

    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        let languagesSets = languages.map { Set<Int>($0) }
        var counter = [Int: Int]()
        var peopleCount = 0
        var visited = [Bool](repeating: false, count: languages.count)

        
        func check(_ p1: Int, _ p2: Int) -> Bool {
            for l in languagesSets[p1] {
                guard !languagesSets[p2].contains(l) else { return true }
            }
            return false
        }
        
        for friendShip in friendships {
            let p1 = friendShip[0] - 1
            let p2 = friendShip[1] - 1
            guard !check(p1, p2) else { continue }

            if !visited[p1] {
                for l in languages[p1] { counter[l,default: 0] += 1 }
                visited[p1] = true
                peopleCount += 1
            }

            if !visited[p2] {
                for l in languages[p2] { counter[l,default: 0] += 1 }
                visited[p2] = true
                peopleCount += 1
            }
        }
        guard peopleCount > 0 else { return 0 }
        return peopleCount - (counter.values.max() ?? languages.count)
    }

}