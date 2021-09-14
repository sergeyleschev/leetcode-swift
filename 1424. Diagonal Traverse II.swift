class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1424. Diagonal Traverse II
    // Given a list of lists of integers, nums, return all elements of nums in diagonal order as shown in the below images.

    // Example 1:
    // Input: nums = [[1,2,3],[4,5,6],[7,8,9]]
    // Output: [1,4,2,7,5,3,8,6,9]

    // Example 2:
    // Input: nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
    // Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]

    // Example 3:
    // Input: nums = [[1,2,3],[4],[5,6,7],[8],[9,10,11]]
    // Output: [1,4,2,5,3,8,6,9,7,10,11]

    // Example 4:
    // Input: nums = [[1,2,3,4,5,6]]
    // Output: [1,2,3,4,5,6]

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i].length <= 10^5
    // 1 <= nums[i][j] <= 10^9
    // There at most 10^5 elements in nums.

    typealias NumberInfo = (r:Int,c:Int,val:Int)
    

    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        guard nums.count > 1 else { return nums[0] }
        var numbers = [NumberInfo]()

        for r in 0..<nums.count {
            for c in 0..<nums[r].count { numbers.append((r,c,nums[r][c])) }
        }

        let sortedNumbers = numbers.sorted { (arg0, arg1) -> Bool in    
            let (r, c, _) = arg0
            let (r1, c1, _) = arg1
            
            if r + c == r1 + c1 { return r > r1 }
            return r + c < r1 + c1
        }
        
        return sortedNumbers.map { $0.val }
    }

}