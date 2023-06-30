class Solution {

    // Solution by Sergey Leschev

    // 274. H-Index
    // Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return compute the researcher's h-index.
    // According to the definition of h-index on Wikipedia: A scientist has an index h if h of their n papers have at least h citations each, and the other n − h papers have no more than h citations each.
    // If there are several possible values for h, the maximum one is taken as the h-index.

    // Computes the researcher's h-index.
    // - Parameter citations: An array of citations of a researcher.
    // - Returns: H-index.

    // Example 1:
    // Input: citations = [3,0,6,1,5]
    // Output: 3
    // Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
    // Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.

    // Example 2:
    // Input: citations = [1,3,1]
    // Output: 1

    // Constraints:
    // n == citations.length
    // 1 <= n <= 5000
    // 0 <= citations[i] <= 1000

    // - Complexity:
    //   - time: O(n), where n is the length of citations.
    //   - space: O(n), where n is the length of citations.

    func hIndex(_ citations: [Int]) -> Int {
        guard !citations.isEmpty else { return 0 }
        let n = citations.count
        var ans = 0

        var papers = [Int](repeating: 0, count: n+1)
        for citation in citations {
            papers[min(n, citation)] += 1
        }

        for i in (0...n).reversed() {
            ans += papers[i]
            guard ans >= i else { continue }
            return i
        }

        return 0
    }

}