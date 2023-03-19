class Solution {

    // Solution @ Sergey Leschev

    func differenceOfSum(_ nums: [Int]) -> Int {
        var elementSum = 0
        var digitSum = 0
        
        for num in nums {
            elementSum += num
            var currentNum = num
            while currentNum > 0 {
                digitSum += currentNum % 10
                currentNum /= 10
            }
        }
        
        return abs(elementSum - digitSum)
    }
}
