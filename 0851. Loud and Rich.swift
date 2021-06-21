class Solution {

    // 851. Loud and Rich
    // In a group of N people (labelled 0, 1, 2, ..., N-1), each person has different amounts of money, and different levels of quietness.
    // For convenience, we'll call the person with label x, simply "person x".
    // We'll say that richer[i] = [x, y] if person x definitely has more money than person y.  Note that richer may only be a subset of valid observations.
    // Also, we'll say quiet[x] = q if person x has quietness q.
    // Now, return answer, where answer[x] = y if y is the least quiet person (that is, the person y with the smallest value of quiet[y]), among all people who definitely have equal to or more money than person x.

    // Example 1:
    // Input: richer = [[1,0],[2,1],[3,1],[3,7],[4,3],[5,3],[6,3]], quiet = [3,2,5,4,6,1,7,0]
    // Output: [5,5,2,5,4,5,6,7]
    // Explanation: 
    // answer[0] = 5.
    // Person 5 has more money than 3, which has more money than 1, which has more money than 0.
    // The only person who is quieter (has lower quiet[x]) is person 7, but
    // it isn't clear if they have more money than person 0.
    // answer[7] = 7.
    // Among all people that definitely have equal to or more money than person 7
    // (which could be persons 3, 4, 5, 6, or 7), the person who is the quietest (has lower quiet[x])
    // is person 7.
    // The other answers can be filled out with similar reasoning.

    // Note:
    // 1 <= quiet.length = N <= 500
    // 0 <= quiet[i] < N, all quiet[i] are different.
    // 0 <= richer.length <= N * (N-1) / 2
    // 0 <= richer[i][j] < N
    // richer[i][0] != richer[i][1]
    // richer[i]'s are all different.
    // The observations in richer are all logically consistent.

    typealias Person = (Number:Int,Quiet:Int)


    func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
        let personCount = quiet.count
        var graph = [Int: Set<Int>]()
        var ans = [Int](repeating: -1, count: personCount)

        for r in richer {
            if nil == graph[r[1]] { graph[r[1]] = [] }
            graph[r[1]]?.insert(r[0])
        }


        func dfs(_ person: Person) -> Person {
            guard let richers = graph[person.Number] else { return person }
            var temp = person
            for r in richers {
                if ans[r]  == -1 {
                    let p = dfs((r,quiet[r]))
                    ans[r] = p.Number
                }
                if quiet[ans[r]] < temp.Quiet {
                     temp.Quiet = quiet[ans[r]]
                     temp.Number = ans[r]
                 }
            }
            return temp
        }

        for personNum in 0..<personCount where ans[personNum] == -1 { ans[personNum] = dfs((personNum,quiet[personNum])).Number }
        
        return ans
    }

 }