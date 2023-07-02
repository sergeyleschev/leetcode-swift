class TopVotedCandidate {

    // Solution by Sergey Leschev

    // 911. Online Election
    // In an election, the i-th vote was cast for persons[i] at time times[i].
    // Now, we would like to implement the following query function: TopVotedCandidate.q(int t) will return the number of the person that was leading the election at time t.
    // Votes cast at time t will count towards our query.  In the case of a tie, the most recent vote (among tied candidates) wins.

    // Example 1:
    // Input: ["TopVotedCandidate","q","q","q","q","q","q"], [[[0,1,1,0,0,1,0],[0,5,10,15,20,25,30]],[3],[12],[25],[15],[24],[8]]
    // Output: [null,0,1,1,0,0,1]
    // Explanation:
    // At time 3, the votes are [0], and 0 is leading.
    // At time 12, the votes are [0,1,1], and 1 is leading.
    // At time 25, the votes are [0,1,1,0,0,1], and 1 is leading (as ties go to the most recent vote.)
    // This continues for 3 more queries at time 15, 24, and 8.

    // Note:
    // 1 <= persons.length = times.length <= 5000
    // 0 <= persons[i] <= persons.length
    // times is a strictly increasing array with all elements in [0, 10^9].
    // TopVotedCandidate.q is called at most 10000 times per test case.
    // TopVotedCandidate.q(int t) is always called with t >= times[0].

    var timeVals: [Int]
    var winners: [Int]

    public init(_ persons: [Int], _ times: [Int]) {
        var first: Int = 0
        var firstname: Int = 0
        var votes: [Int: Int] = [:]
        timeVals = times
        winners = []

        for i in 0...persons.count - 1 {
            let person = persons[i]
            if votes[person] == nil { votes[person] = 0 }
            let personVote = votes[person]! + 1
            votes[person] = personVote
            if personVote >= first {
                first = personVote
                firstname = person
            }
            winners.append(firstname)
        }
    }

    public func q(_ t: Int) -> Int {
        var left = 0
        var mid = 0
        var right = timeVals.count - 1
        var found = false

        while left <= right {
            mid = (left + right) / 2
            if timeVals[mid] == t {
                found = true
                break
            } else if timeVals[mid] < t {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return found ? winners[mid] : winners[right]
    }

}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */
