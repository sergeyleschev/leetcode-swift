class KthLargest {

    // Solution @ Sergey Leschev

    // 703. Kth Largest Element in a Stream
    // Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.
    // Implement KthLargest class:
    // KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
    // int add(int val) Returns the element representing the kth largest element in the stream.

    // Example 1:
    // Input
    // ["KthLargest", "add", "add", "add", "add", "add"]
    // [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
    // Output
    // [null, 4, 5, 5, 8, 8]
    // Explanation
    // KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
    // kthLargest.add(3);   // return 4
    // kthLargest.add(5);   // return 5
    // kthLargest.add(10);  // return 5
    // kthLargest.add(9);   // return 8
    // kthLargest.add(4);   // return 8

    // Constraints:
    // 1 <= k <= 10^4
    // 0 <= nums.length <= 10^4
    // -10^4 <= nums[i] <= 10^4
    // -10^4 <= val <= 10^4
    // At most 10^4 calls will be made to add.
    // It is guaranteed that there will be at least k elements in the array when you search for the kth element.

    var values: [Int] = []
    let k: Int
    var size: Int = 0
    

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for n in nums { add(n) }
    }
    

    func add(_ val: Int) -> Int {
        if size >= k {
            if val > values[0] {
                values[0] = val
                shiftDown(0)
            }

        } else {
            values.append(val)
            shiftUp(size)
            size += 1
        }

        return values[0]
    }
    

    private func shiftUp(_ index: Int) {
        let e = values[index]
        var i = index
        
        while i > 0 {
            let parentIndex = (i - 1) >> 1
            let parent = values[parentIndex]
            if parent <= e { break }
            values[i] = parent
            i = parentIndex
        }
        values[i] = e
    }
    

    private func shiftDown(_ index: Int) {
        let e = values[index]
        let half = size >> 1
        var i = index
        
        while i < half { 
            var childIndex = (i << 1) + 1   
            var child = values[childIndex]      
            let rightIndex = childIndex + 1

            if rightIndex < size && values[rightIndex] < child {
                child = values[rightIndex] 
                childIndex = rightIndex
            }
            
            if child >= e { break }
            values[i] = child
            i = childIndex
        }
        values[i] = e
    }

}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */