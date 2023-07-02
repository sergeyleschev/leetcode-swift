class Solution {

    // Solution by Sergey Leschev

    // 433. Minimum Genetic Mutation
    // A gene string can be represented by an 8-character long string, with choices from 'A', 'C', 'G', and 'T'.
    // Suppose we need to investigate a mutation from a gene string start to a gene string end where one mutation is defined as one single character changed in the gene string.
    // For example, "AACCGGTT" --> "AACCGGTA" is one mutation.
    // There is also a gene bank bank that records all the valid gene mutations. A gene must be in bank to make it a valid gene string.
    // Given the two gene strings start and end and the gene bank bank, return the minimum number of mutations needed to mutate from start to end. If there is no such a mutation, return -1.
    // Note that the starting point is assumed to be valid, so it might not be included in the bank.

    // Example 1:
    // Input: start = "AACCGGTT", end = "AACCGGTA", bank = ["AACCGGTA"]
    // Output: 1

    // Example 2:
    // Input: start = "AACCGGTT", end = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
    // Output: 2

    // Example 3:
    // Input: start = "AAAAACCC", end = "AACCCCCC", bank = ["AAAACCCC","AAACCCCC","AACCCCCC"]
    // Output: 3

    // Constraints:
    // start.length == 8
    // end.length == 8
    // 0 <= bank.length <= 10
    // bank[i].length == 8
    // start, end, and bank[i] consist of only the characters ['A', 'C', 'G', 'T'].

    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var visited: [Int] = Array(repeating: 0, count: bank.count + 1)
        var bankDict: [String: Int] = [:]
        let characters: [Character] = [.init("A"), .init("C"), .init("G"), .init("T")]

        for i in 0..<bank.count { bankDict[bank[i]] = i + 1 }
        bankDict[start] = 0
        guard let target = bankDict[end] else { return -1 }

        var queue: [(Int, Int)] = [(0, 0)]
        visited[0] = 1

        while !queue.isEmpty {
            let tail = queue.removeFirst()
            if tail.0 == target { return tail.1 }
            var gene: String = ""
            if tail.0 == 0 {
                gene = start
            } else {
                gene = bank[tail.0 - 1]
            }

            for (i, c) in gene.enumerated() {
                for replace in characters {
                    if replace == c { continue }
                    var newCharSet = Array(gene)
                    newCharSet[i] = replace
                    let newString = String(newCharSet)
                    if let index = bankDict[newString], visited[index] == 0 {
                        queue.append((index, tail.1 + 1))
                        visited[index] = 1
                    }
                }
            }

        }

        return -1
    }

}
