class Solution {

    // Solution by Sergey Leschev
    // 2512. Reward Top K Students

    func topStudents(
        _ positive_feedback: [String], _ negative_feedback: [String], _ report: [String],
        _ student_id: [Int], _ k: Int
    ) -> [Int] {
        var stud = [(score: Int, id: Int)]()
        let pos = Set(positive_feedback)
        let neg = Set(negative_feedback)

        for (rep, sid) in zip(report, student_id) {
            var score = 0
            for w in rep.split(separator: " ") {
                let word = String(w)
                if pos.contains(word) {
                    score += 3
                }
                if neg.contains(word) {
                    score -= 1
                }
            }
            stud.append((score, sid))
        }

        stud.sort { a, b in
            if a.score == b.score {
                return a.id < b.id
            }
            return a.score > b.score
        }

        return stud.prefix(k).map { $0.id }
    }
}
