class NumArray {

    // Solution @ Sergey Leschev

    // 307. Range Sum Query - Mutable
    // Given an integer array nums, handle multiple queries of the following types:
    // Update the value of an element in nums.
    // Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
    // Implement the NumArray class:
    // NumArray(int[] nums) Initializes the object with the integer array nums.
    // void update(int index, int val) Updates the value of nums[index] to be val.
    // int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

    // Example 1:
    // Input
    // ["NumArray", "sumRange", "update", "sumRange"]
    // [[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
    // Output
    // [null, 9, null, 8]
    // Explanation
    // NumArray numArray = new NumArray([1, 3, 5]);
    // numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
    // numArray.update(1, 2);   // nums = [1, 2, 5]
    // numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8

    // Constraints:
    // 1 <= nums.length <= 3 * 10^4
    // -100 <= nums[i] <= 100
    // 0 <= index < nums.length
    // -100 <= val <= 100
    // 0 <= left <= right < nums.length
    // At most 3 * 10^4 calls will be made to update and sumRange.

    private var nums: [Int]
    private var blockSums: [Int]


    init(_ nums: [Int]) {
        self.nums = nums
        let blockCount = Int(sqrt(Double(nums.count)).rounded(.up))
        blockSums = [Int](repeating: 0, count: blockCount)

        for (i, num) in nums.enumerated() {
            blockSums[i / blockCount] += num
        }
    }


    func update(_ i: Int, _ val: Int) {
        let blockNum = i / blockSums.count
        blockSums[blockNum] += val - nums[i]
        nums[i] = val
    }


    func sumRange(_ i: Int, _ j: Int) -> Int {
        let blockCount = blockSums.count
        let startBlock = i / blockCount
        let startBlockStartIndex = startBlock * blockCount
        let endBlock = j / blockCount
        let endBlockEndIndex = min(endBlock * blockCount + (blockCount - 1), nums.count - 1)
        
        var blockSum = blockSums[startBlock...endBlock].reduce(0, +)

        for k in startBlockStartIndex..<i { blockSum -= nums[k] }
        for k in stride(from: j + 1, through: endBlockEndIndex, by: 1) { blockSum -= nums[k] }

        return blockSum
    }
    
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */