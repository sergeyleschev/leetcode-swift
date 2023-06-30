class Solution {

    // Solution by Sergey Leschev

    // 996. Number of Squareful Arrays
    // Given an array nums of non-negative integers, the array is squareful if for every pair of adjacent elements, their sum is a perfect square.
    // Return the number of permutations of nums that are squareful.  Two permutations perm1 and perm2 differ if and only if there is some index i such that perm1[i] != perm2[i].

    // Example 1:
    // Input: nums = [1,17,8]
    // Output: 2
    // Explanation: 
    // [1,8,17] and [17,8,1] are the valid permutations.

    // Example 2:
    // Input: nums = [2,2,2]
    // Output: 1

    // Note:
    // 1 <= nums.length <= 12
    // 0 <= nums[i] <= 10^9
    
    func numSquarefulPerms(_ A: [Int]) -> Int {
        var ans = 0
        var set = Set<[Int]>()
        var map = [Int: Set<Int>]()
        var currentArr = [Int]()
        var visited = [Bool](repeating: false, count: A.count)
        var beginings = Set<Int>()

        for i in 0..<(A.count - 1) {
            for j in (i + 1)..<A.count {
                if isSqureNumber(A[i] + A[j]) {
                    if nil == map[i] { map[i] = [] }
                    if nil == map[j] { map[j] = [] }
                    map[i]?.insert(j)
                    map[j]?.insert(i)
                }
            }
        }

        
        func backtracking(_ currentArr: inout [Int], _ visited: inout [Bool],_ lastIndex: Int) {
            guard currentArr.count < A.count else {
                if !set.contains(currentArr) {
                    ans += 1
                    set.insert(currentArr)
                }
                return
            }

            if let indices = map[lastIndex] {
                var temp = Set<Int>()
                for index in indices {
                    if !visited[index] && !temp.contains(A[index]){
                        temp.insert(A[index])
                        visited[index] = true
                        currentArr.append(A[index])
                        backtracking(&currentArr, &visited, index)
                        visited[index] = false
                        currentArr.removeLast()
                    }
                }
            }
        }

        for i in 0..<A.count {
            if !beginings.contains(A[i]) {
                beginings.insert(A[i])
                currentArr.append(A[i])
                visited[i] = true
                backtracking(&currentArr, &visited,i)
                currentArr.removeLast()
                visited[i] = false
            }
        }

        return ans
    }
    
    
    private func isSqureNumber(_  num: Int) -> Bool {
        let sq = Int(sqrt(Double(num)))
        return sq * sq == num
    }
}