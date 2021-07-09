class Solution {

    // 1345. Jump Game IV
    // Given an array of integers arr, you are initially positioned at the first index of the array.
    // In one step you can jump from index i to index:
    // i + 1 where: i + 1 < arr.length.
    // i - 1 where: i - 1 >= 0.
    // j where: arr[i] == arr[j] and i != j.
    // Return the minimum number of steps to reach the last index of the array.
    // Notice that you can not jump outside of the array at any time.

    // Finds the minimum number of steps to reach the last index of the array.
    //
    // - Parameter arr: An array of integers.
    // - Returns: The minimum number of steps.

    // Example 1:
    // Input: arr = [100,-23,-23,404,100,23,23,23,3,404]
    // Output: 3
    // Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.

    // Example 2:
    // Input: arr = [7]
    // Output: 0
    // Explanation: Start index is the last index. You don't need to jump.

    // Example 3:
    // Input: arr = [7,6,9,6,9,6,9,7]
    // Output: 1
    // Explanation: You can jump directly from index 0 to index 7 which is last index of the array.

    // Example 4:
    // Input: arr = [6,1,9]
    // Output: 2

    // Example 5:
    // Input: arr = [11,22,7,7,7,7,7,7,7,22,13]
    // Output: 3

    // Constraints:
    // 1 <= arr.length <= 5 * 10^4
    // -108 <= arr[i] <= 10^8

    // - Complexity:
    //   - time: O(n), where n is the length of arr.
    //   - space: O(n), where n is the length of arr.
    
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        guard n > 1 else { return 0 }
        var graph = [Int: [Int]]()
        var cur = [Int]()
        var visited = Set<Int>()
        var step = 0

        for i in 0..<n { graph[arr[i], default: [Int]()].append(i) }
        
        cur.append(0)
        
        while !cur.isEmpty {
            var next = [Int]()

            for node in cur {
                guard node != n - 1 else { return step }
                
                for child in graph[arr[node]] ?? [] {
                    guard !visited.contains(child) else { continue }
                    visited.insert(child)
                    next.append(child)
                }
                
                graph.removeValue(forKey: arr[node])

                if node + 1 < n, !visited.contains(node + 1) { visited.insert(node + 1); next.append(node + 1) }
                if node - 1 >= 0, !visited.contains(node - 1) { visited.insert(node - 1); next.append(node - 1) }
            }
            
            cur = next
            step += 1
        }
        
        return -1
    }

}