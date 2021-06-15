class Solution {

    // 632. Smallest Range Covering Elements from K Lists
    // You have k lists of sorted integers in non-decreasing order. Find the smallest range that includes at least one number from each of the k lists.
    // We define the range [a, b] is smaller than range [c, d] if b - a < d - c or a < c if b - a == d - c.

    // Example 1:
    // Input: nums = [[4,10,15,24,26],[0,9,12,20],[5,18,22,30]]
    // Output: [20,24]
    // Explanation: 
    // List 1: [4, 10, 15, 24,26], 24 is in range [20,24].
    // List 2: [0, 9, 12, 20], 20 is in range [20,24].
    // List 3: [5, 18, 22, 30], 22 is in range [20,24].

    // Example 2:
    // Input: nums = [[1,2,3],[1,2,3],[1,2,3]]
    // Output: [1,1]

    // Example 3:
    // Input: nums = [[10,10],[11,11]]
    // Output: [10,11]

    // Example 4:
    // Input: nums = [[10],[11]]
    // Output: [10,11]

    // Example 5:
    // Input: nums = [[1],[2],[3],[4],[5],[6],[7]]
    // Output: [1,7]

    // Constraints:
    // nums.length == k
    // 1 <= k <= 3500
    // 1 <= nums[i].length <= 50
    // -10^5 <= nums[i][j] <= 10^5
    // nums[i] is sorted in non-decreasing order.

    func smallestRange(_ nums: [[Int]]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        
        var pq =  PriorityQueue<Point>(ascending: true)
        var maxValue = 0
        var indexArr = Array(repeating: 0, count: nums.count)
        for (i, list) in nums.enumerated() {
            pq.push(Point(x: list.first!, y: i))
            maxValue = max(maxValue, list.first!)
        }
        
        var start = -1, end = -1, interval = Int.max
        while pq.count == nums.count {
            var peak = pq.pop()!
            let minValue = peak.x, index = peak.y
            if maxValue - minValue < interval {
                interval = maxValue - minValue
                start = minValue
                end = maxValue
            }
            indexArr[index] += 1
            let index_y = indexArr[index]
            if index_y < nums[index].count {
                peak.x = nums[index][index_y]
                pq.push(peak)
                maxValue = max(peak.x, maxValue)
            }
        }
        
        return [start, end]
    }
}


public struct PriorityQueue<T: Comparable> {
    public var count: Int { return heap.count }
    public var isEmpty: Bool { return heap.isEmpty }
    fileprivate var heap = [T]()
    private let ordered: (T, T) -> Bool
    

    public init(ascending: Bool = false) {
        self.init(order: ascending ? { $0 > $1 } : { $0 < $1 })
    }
    

    public init(order: @escaping (T, T) -> Bool) {
        ordered = order
        var i = heap.count/2 - 1
        while i >= 0 { sink(i); i -= 1 }
    }

    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }

    
    public mutating func pop() -> T? {    
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        sink(0)
        
        return temp
    }
    

    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {        
            var j = 2 * index + 1
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j += 1 }
            if !ordered(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }
    

    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}


extension PriorityQueue: IteratorProtocol {
    public typealias Element = T
    mutating public func next() -> Element? { return pop() }
}


extension PriorityQueue: Sequence {    
    public typealias Iterator = PriorityQueue
    public func makeIterator() -> Iterator { return self }
}


extension PriorityQueue: Collection {    
    public typealias Index = Int
    public var startIndex: Int { return heap.startIndex }
    public var endIndex: Int { return heap.endIndex }
    public subscript(i: Int) -> T { return heap[i] }
    

    public func index(after i: PriorityQueue.Index) -> PriorityQueue.Index {
        return heap.index(after: i)
    }
}


extension PriorityQueue: CustomStringConvertible {
    public var description: String { heap.description }
}


struct Point {
    var x: Int
    var y: Int
}


extension Point: Comparable {    
    static func < (lhs: Point, rhs: Point) -> Bool { lhs.x < rhs.x }
    static func == (lhs: Point, rhs: Point) -> Bool { lhs.x == rhs.x && lhs.y == rhs.y }
}