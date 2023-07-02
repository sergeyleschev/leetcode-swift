class Solution {

    // Solution by Sergey Leschev

    func findTheArrayConcVal(_ nums: [Int]) -> Int {
        var concatValue = 0
        var nums = nums

        while nums.count > 0 {
            if nums.count == 1 {
                concatValue += nums[0]
                nums.removeFirst()
            } else {
                let concatNum = Int(String(nums[0]) + String(nums[nums.count - 1]))!
                concatValue += concatNum
                nums.removeFirst()
                nums.removeLast()
            }
        }

        return concatValue
    }
}
