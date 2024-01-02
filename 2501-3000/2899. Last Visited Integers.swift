class Solution {

    // Solution by Sergey Leschev
    // 2899. Last Visited Integers

    func lastVisitedIntegers(_ words: [String]) -> [Int] {
        var v: [Int] = []
        var ans: [Int] = []
        var count = 0

        for word in words {
            if word == "prev" {
                count += 1
                if count > v.count {
                    ans.append(-1)
                } else {
                    ans.append(v[v.count - count])
                }
            } else {
                count = 0
                v.append(Int(word)!)
            }
        }
        return ans
    }
}
