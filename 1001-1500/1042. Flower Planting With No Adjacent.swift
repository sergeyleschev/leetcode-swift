class Solution {

    // Solution by Sergey Leschev

    // 1042. Flower Planting With No Adjacent
    // You have n gardens, labeled from 1 to n, and an array paths where paths[i] = [xi, yi] describes a bidirectional path between garden xi to garden yi. In each garden, you want to plant one of 4 types of flowers.
    // All gardens have at most 3 paths coming into or leaving it.
    // Your task is to choose a flower type for each garden such that, for any two gardens connected by a path, they have different types of flowers.
    // Return any such a choice as an array answer, where answer[i] is the type of flower planted in the (i+1)th garden. The flower types are denoted 1, 2, 3, or 4. It is guaranteed an answer exists.

    // Example 1:
    // Input: n = 3, paths = [[1,2],[2,3],[3,1]]
    // Output: [1,2,3]
    // Explanation:
    // Gardens 1 and 2 have different types.
    // Gardens 2 and 3 have different types.
    // Gardens 3 and 1 have different types.
    // Hence, [1,2,3] is a valid answer. Other valid answers include [1,2,4], [1,4,2], and [3,2,1].

    // Example 2:
    // Input: n = 4, paths = [[1,2],[3,4]]
    // Output: [1,2,1,2]

    // Example 3:
    // Input: n = 4, paths = [[1,2],[2,3],[3,4],[4,1],[1,3],[2,4]]
    // Output: [1,2,3,4] 

    // Constraints:
    // 1 <= n <= 10^4
    // 0 <= paths.length <= 2 * 10^4
    // paths[i].length == 2
    // 1 <= xi, yi <= n
    // xi != yi
    // Every garden has at most 3 paths coming into or leaving it.

    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        if paths.count == 0 { return Array(repeating: 1, count: N) }
        let path: [Int] = Array()
        var G: [[Int]] = Array(repeating: path, count: N)
        var colorsArray = Array(repeating: 0, count: N)
        
        for i in 0..<paths.count {
            G[paths[i][0] - 1].append(paths[i][1])
            G[paths[i][1] - 1].append(paths[i][0])
        }
        
        for i in 0..<G.count {
            let colors: [Int] = [1,2,3,4]
            for j in 0..<4 {
                colorsArray[i] = colors[j]
                var flag = true
                for item in G[i] {
                    if colorsArray[i] == colorsArray[item - 1]{
                        flag = false
                        break
                    }
                }
                if flag { break }
            }
        }
        
        return colorsArray
    }

}