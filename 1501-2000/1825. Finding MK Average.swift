class MKAverage {

    // Solution by Sergey Leschev

    // 1825. Finding MK Average
    // You are given two integers, m and k, and a stream of integers. You are tasked to implement a data structure that calculates the MKAverage for the stream.
    // The MKAverage can be calculated using these steps:
    // If the number of the elements in the stream is less than m you should consider the MKAverage to be -1. Otherwise, copy the last m elements of the stream to a separate container.
    // Remove the smallest k elements and the largest k elements from the container.
    // Calculate the average value for the rest of the elements rounded down to the nearest integer.
    // Implement the MKAverage class:
    // MKAverage(int m, int k) Initializes the MKAverage object with an empty stream and the two integers m and k.
    // void addElement(int num) Inserts a new element num into the stream.
    // int calculateMKAverage() Calculates and returns the MKAverage for the current stream rounded down to the nearest integer.

    // Example 1:
    // Input
    // ["MKAverage", "addElement", "addElement", "calculateMKAverage", "addElement", "calculateMKAverage", "addElement", "addElement", "addElement", "calculateMKAverage"]
    // [[3, 1], [3], [1], [], [10], [], [5], [5], [5], []]
    // Output
    // [null, null, null, -1, null, 3, null, null, null, 5]
    // Explanation
    // MKAverage obj = new MKAverage(3, 1);
    // obj.addElement(3);        // current elements are [3]
    // obj.addElement(1);        // current elements are [3,1]
    // obj.calculateMKAverage(); // return -1, because m = 3 and only 2 elements exist.
    // obj.addElement(10);       // current elements are [3,1,10]
    // obj.calculateMKAverage(); // The last 3 elements are [3,1,10].
    //                           // After removing smallest and largest 1 element the container will be [3].
    //                           // The average of [3] equals 3/1 = 3, return 3
    // obj.addElement(5);        // current elements are [3,1,10,5]
    // obj.addElement(5);        // current elements are [3,1,10,5,5]
    // obj.addElement(5);        // current elements are [3,1,10,5,5,5]
    // obj.calculateMKAverage(); // The last 3 elements are [5,5,5].
    //                           // After removing smallest and largest 1 element the container will be [5].
    //                           // The average of [5] equals 5/1 = 5, return 5

    // Constraints:
    // 3 <= m <= 10^5
    // 1 <= k*2 < m
    // 1 <= num <= 10^5
    // At most 10^5 calls will be made to addElement and calculateMKAverage.

    // Solution: binary search
    // keep original arr
    // save one sorted arr
    // record sum between [k...m - k - 1]

    // - Complexity:
    //   - time: addElement: O(logn), calculateMLAverage: O(1)
    //   - space: O(n)

    var sorted: [Int]
    var arr: [Int]
    let m: Int
    let k: Int
    var sum: Int

    init(_ m: Int, _ k: Int) {
        arr = [Int]()
        sorted = [Int]()
        self.m = m
        self.k = k
        sum = 0
    }

    func addElement(_ num: Int) {
        if arr.count == m {
            let removeEle = arr.removeFirst()
            removeFromSorted(removeEle)
        }

        arr.append(num)
        insertIntoSorted(num)
    }

    func insertIntoSorted(_ target: Int) {
        if sorted.isEmpty {
            sorted.append(target)
            return
        }
        var left = 0
        var right = sorted.count - 1

        while left < right {
            let mid = left + (right - left) / 2
            if sorted[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        let index = sorted[left] < target ? left + 1 : left

        if 2 * k <= sorted.count {
            if index < k {
                sum += sorted[k - 1]
            } else if index <= sorted.count - k {
                sum += target
            } else {
                sum += sorted[sorted.count - k]
            }
        }

        sorted.insert(target, at: index)
    }

    func removeFromSorted(_ target: Int) {
        var left = 0
        var right = m - 1

        while left < right {
            let mid = left + (right - left) / 2
            if sorted[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if sorted[left] == target {
            if left < k {
                sum -= sorted[k]
            } else if left < m - k {
                sum -= target
            } else {
                sum -= sorted[m - k - 1]
            }
            sorted.remove(at: left)
        }
    }

    func calculateMKAverage() -> Int {
        if arr.count < m { return -1 }
        return sum / (m - k * 2)
    }

}

/**
 * Your MKAverage object will be instantiated and called as such:
 * let obj = MKAverage(m, k)
 * obj.addElement(num)
 * let ret_2: Int = obj.calculateMKAverage()
 */
