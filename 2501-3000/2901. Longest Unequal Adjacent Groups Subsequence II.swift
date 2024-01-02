class Solution {

    // Solution by Sergey Leschev
    // 2901. Longest Unequal Adjacent Groups Subsequence II

    func calculateHammingDistance(_ w1: String, _ w2: String) -> Int {
        var hamDist = 0

        for (k1, k2) in zip(w1, w2) {
            if k1 != k2 {
                hamDist += 1
                if hamDist > 1 {
                    break
                }
            }
        }

        return hamDist
    }

    func getWordsInLongestSubsequence(_ n: Int, _ words: [String], _ groups: [Int]) -> [String] {
        var dp: [[String]] = Array(repeating: [], count: n)

        for i in 0..<n {
            dp[i].append(words[i])
        }

        var maxLength = 1

        for i in 1..<n {
            for j in 0..<i {

                if groups[j] != groups[i] && words[j].count == words[i].count {

                    let hamDist = calculateHammingDistance(words[i], words[j])

                    if hamDist == 1 {
                        if dp[j].count + 1 > dp[i].count {
                            dp[i] = dp[j]
                            dp[i].append(words[i])
                            maxLength = max(maxLength, dp[i].count)
                        }
                    }
                }
            }
        }

        var longestSubsequence: [String] = []
        for i in 0..<n {
            if dp[i].count == maxLength {
                longestSubsequence = dp[i]
                break
            }
        }

        return longestSubsequence
    }
}
