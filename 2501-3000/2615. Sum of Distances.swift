class Solution {

    // Solution by Sergey Leschev
    // 2615. Sum of Distances

    func distance(_ nums: [Int]) -> [Int] {
        var output = [Int](repeating: 0, count: nums.count)
        var sumMap = [Int: Int]()
        var countMap = [Int: Int]()

        for i in 0..<nums.count {
            if sumMap[nums[i]] == nil {
                sumMap[nums[i]] = 0
                countMap[nums[i]] = 0
            }

            output[i] += i * countMap[nums[i]]! - sumMap[nums[i]]!
            sumMap[nums[i]]! += i
            countMap[nums[i]]! += 1
        }

        sumMap.removeAll()
        countMap.removeAll()
        let len = nums.count
        for i in stride(from: len - 1, through: 0, by: -1) {
            if sumMap[nums[i]] == nil {
                sumMap[nums[i]] = 0
                countMap[nums[i]] = 0
            }

            output[i] += (len - i - 1) * countMap[nums[i]]! - sumMap[nums[i]]!
            sumMap[nums[i]]! += (len - i - 1)
            countMap[nums[i]]! += 1
        }

        return output
    }
}
