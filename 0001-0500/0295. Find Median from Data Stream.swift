class MedianFinder {

    // Solution by Sergey Leschev

    // 295. Find Median from Data Stream
    // The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value and the median is the mean of the two middle values.
    // For example, for arr = [2,3,4], the median is 3.
    // For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
    // Implement the MedianFinder class:

    // MedianFinder() initializes the MedianFinder object.
    // void addNum(int num) adds the integer num from the data stream to the data structure.
    // double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
     
    // Example 1:
    // Input
    // ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
    // [[], [1], [2], [], [3], []]
    // Output
    // [null, null, null, 1.5, null, 2.0]

    // Explanation
    // MedianFinder medianFinder = new MedianFinder();
    // medianFinder.addNum(1);    // arr = [1]
    // medianFinder.addNum(2);    // arr = [1, 2]
    // medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
    // medianFinder.addNum(3);    // arr[1, 2, 3]
    // medianFinder.findMedian(); // return 2.0
     
    // Constraints:
    // -10^5 <= num <= 10^5
    // There will be at least one element in the data structure before calling findMedian.
    // At most 5 * 10^4 calls will be made to addNum and findMedian.
     
    // Follow up:
    // If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
    // If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
    
    var nums : [Int]
    
    /** initialize your data structure here. */
    init() {
        nums = [Int]()
    }
    
    
    func addNum(_ num: Int) {
        if nums.isEmpty { nums.append(num); return }
        
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] < num {
                left = mid + 1
            } else if nums[mid] == num {
                left = mid; break
            } else {
                right = mid - 1
            }
        }
        
        nums.insert(num, at: left)
    }
    
    
    func findMedian() -> Double {
        guard !nums.isEmpty else { return 0 }
        
        if nums.count % 2 == 1 {
            return Double(nums[nums.count / 2])
        } else {
            let r1 = nums[nums.count / 2]
            let r2 = nums[nums.count / 2 - 1]
            return Double(r1 + r2) / 2
        }
    }
    
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */