class Solution {

    // 871. Minimum Number of Refueling Stops
    // A car travels from a starting position to a destination which is target miles east of the starting position.
    // There are gas stations along the way. The gas stations are represented as an array stations where stations[i] = [positioni, fueli] indicates that the ith gas station is positioni miles east of the starting position and has fueli liters of gas.
    // The car starts with an infinite tank of gas, which initially has startFuel liters of fuel in it. It uses one liter of gas per one mile that it drives. When the car reaches a gas station, it may stop and refuel, transferring all the gas from the station into the car.
    // Return the minimum number of refueling stops the car must make in order to reach its destination. If it cannot reach the destination, return -1.
    // Note that if the car reaches a gas station with 0 fuel left, the car can still refuel there. If the car reaches the destination with 0 fuel left, it is still considered to have arrived.

    // Example 1:
    // Input: target = 1, startFuel = 1, stations = []
    // Output: 0
    // Explanation: We can reach the target without refueling.

    // Example 2:
    // Input: target = 100, startFuel = 1, stations = [[10,100]]
    // Output: -1
    // Explanation: We can not reach the target (or even the first gas station).

    // Example 3:
    // Input: target = 100, startFuel = 10, stations = [[10,60],[20,30],[30,30],[60,40]]
    // Output: 2
    // Explanation: We start with 10 liters of fuel.
    // We drive to position 10, expending 10 liters of fuel.  We refuel from 0 liters to 60 liters of gas.
    // Then, we drive from position 10 to position 60 (expending 50 liters of fuel),
    // and refuel from 10 liters to 50 liters of gas.  We then drive to and reach the target.
    // We made 2 refueling stops along the way, so we return 2.

    // Constraints:
    // 1 <= target, startFuel <= 10^9
    // 0 <= stations.length <= 500
    // 0 <= positioni <= positioni + 1 < target
    // 1 <= fueli < 10^9

    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        var pq = Heap<Int>(sort: >)
        var maxDistance = startFuel
        var stops = 0
        var i = 0

        while maxDistance < target {
            // We maintain a max heap of the station that has the most gas, and is still
            // reachable with what we have in our startFuel
            while i < stations.count && stations[i][0] <= maxDistance {
                pq.insert(stations[i][1])
                i += 1
            }

            if pq.isEmpty { return -1 }

            maxDistance += pq.remove()!
            stops += 1
        }

        return stops
    }
}


public struct Heap<T> {
    
    /** The array that stores the heap's nodes. */

    var nodes = [T]()


    /**
     * Determines how to compare two nodes in the heap.
     * Use '>' for a max-heap or '<' for a min-heap,
     * or provide a comparing method if the heap is made
     * of custom elements, for example tuples.
     */

    private var orderCriteria: (T, T) -> Bool


    /**
     * Creates an empty heap.
     * The sort function determines whether this is a min-heap or max-heap.
     * For comparable data types, > makes a max-heap, < makes a min-heap.
     */

    public init(sort: @escaping (T, T) -> Bool) { self.orderCriteria = sort }


    /**
     * Creates a heap from an array. The order of the array does not matter;
     * the elements are inserted into the heap in the order determined by the
     * sort function. For comparable data types, '>' makes a max-heap,
     * '<' makes a min-heap.
     */

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }


    /**
     * Configures the max-heap or min-heap from an array, in a bottom-up manner.
     * Performance: This runs pretty much in O(n).
     */

    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) { shiftDown(i) }
    }


    public var isEmpty: Bool { nodes.isEmpty }
    public var count: Int { nodes.count }


    /**
     * Returns the index of the parent of the element at index i.
     * The element at index 0 is the root of the tree and has no parent.
     */

    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int { (i - 1) / 2 }


    /**
     * Returns the index of the left child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no left child.
     */

    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int { 2 * i + 1 }


    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     */

    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int { 2 * i + 2 }


    /**
     * Returns the maximum value in the heap (for a max-heap) or the minimum
     * value (for a min-heap).
     */

    public func peek() -> T? { nodes.first }


    /**
     * Adds a new value to the heap. This reorders the heap so that the max-heap
     * or min-heap property still holds. Performance: O(log n).
     */

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }


    /**
     * Adds a sequence of values to the heap. This reorders the heap so that
     * the max-heap or min-heap property still holds. Performance: O(log n).
     */

    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence { insert(value) }
    }


    /**
     * Allows you to change an element. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     */

    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }

        remove(at: i)
        insert(value)
    }


    /**
     * Removes the root node from the heap. For a max-heap, this is the maximum
     * value; for a min-heap it is the minimum value. Performance: O(log n).
     */

    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)

            return value
        }
    }


    /**
     * Removes an arbitrary node from the heap. Performance: O(log n).
     * Note that you need to know the node's index.
     */

    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }

        return nodes.removeLast()
    }


    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     */

    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }


    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     */

    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) { first = leftChildIndex }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) { first = rightChildIndex }
        if first == index { return }
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }


    internal mutating func shiftDown(_ index: Int) { shiftDown(from: index, until: nodes.count) }

}


// MARK: - Searching
extension Heap where T: Equatable {
    /** Get the index of a node in the heap. Performance: O(n). */
    public func index(of node: T) -> Int? { nodes.firstIndex(where: { $0 == node }) }


    /** Removes the first occurrence of a node from the heap. Performance: O(n log n). */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) { return remove(at: index) }
        return nil
    }

}