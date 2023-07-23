class Solution {

    // Solution by Sergey Leschev
    // 2239. Find Closest Number to Zero

    func findClosestNumber(_ nums: [Int]) -> Int {
        var closest = nums[0]

        for num in nums {
            if abs(num) < abs(closest) || (abs(num) == abs(closest) && num > closest) {
                closest = num
            }
        }

        return closest
    }
}
