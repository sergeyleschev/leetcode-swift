class Solution {

    // Solution @ Sergey Leschev

    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var leftSum = [Int](repeating: 0, count: nums.count)
        var rightSum = [Int](repeating: 0, count: nums.count)
        
        // calculate the left sum of each element
        for i in 1..<nums.count {
            leftSum[i] = leftSum[i-1] + nums[i-1]
        }
        
        // calculate the right sum of each element
        for i in (0..<nums.count-1).reversed() {
            rightSum[i] = rightSum[i+1] + nums[i+1]
        }
        
        // calculate the answer array
        var answer = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            answer[i] = abs(leftSum[i] - rightSum[i])
        }
        
        return answer
    }
}
