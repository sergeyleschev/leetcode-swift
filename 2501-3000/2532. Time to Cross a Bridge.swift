class Solution {

    // Solution by Sergey Leschev
    // 2532. Time to Cross a Bridge

    // The main for-loop in the code handles the following steps:
    // 1. Update the waiting list on the bridge.
    // 2. Pick a worker to pass the bridge based on the defined conditions.
    // 3. Advance the time.
    // 4. Update the count of remaining boxes that need to be moved.

    // Noteworthy points:
    // 1. When there are enough workers on the right bank, workers on the left side should not pass the bridge.
    // 2. When there are no workers waiting to cross the bridge on either side,
    //    the time is moved to the next moment when a worker could potentially be waiting to cross.

    // Overflow checks have been taken into consideration.
    // The maximum time to move a box is at most 4 * 1000 (four steps to move the box, each taking 1000 time).
    // With at most 1e4 boxes, the total time is at most 4e7, ensuring the solution is safe.

    func findCrossingTime(_ n: Int, _ k: Int, _ time: [[Int]]) -> Int {
        var lBank = PriorityQueue<Int>(comparator: { (a, b) -> Bool in
            let ta = time[a]
            let tb = time[b]
            let ca = ta[0] + ta[2]
            let cb = tb[0] + tb[2]
            if ca == cb { return b < a }  // larger index cross first
            return cb < ca  // larger cross time cross first.
        })
        var rBank = PriorityQueue<Int>(comparator: { (a, b) -> Bool in
            let ta = time[a]
            let tb = time[b]
            let ca = ta[0] + ta[2]
            let cb = tb[0] + tb[2]
            if ca == cb { return b < a }  // larger index cross first
            return cb < ca  // larger cross time cross first.
        })

        // 0 -> time of the worker will be waiting to cross the bridge, 1 ->idx
        var lWorker = PriorityQueue<(Int, Int)>(comparator: { (a, b) -> Bool in a.0 < b.0 })
        var rWorker = PriorityQueue<(Int, Int)>(comparator: { (a, b) -> Bool in a.0 < b.0 })

        // initially, all at left bank
        for i in 0..<k {
            lBank.add(i)
        }

        var curTime = 0
        var remainingBoxes = n
        while remainingBoxes > 0 {
            // process worker
            while !lWorker.isEmpty && lWorker.peek()!.0 <= curTime {
                lBank.add(lWorker.poll()!.1)
            }
            while !rWorker.isEmpty && rWorker.peek()!.0 <= curTime {
                rBank.add(rWorker.poll()!.1)
            }

            var worker = -1
            if !rBank.isEmpty {
                // right side can pass, a box will be put
                worker = rBank.poll()!
                let t = time[worker]
                lWorker.add((curTime + t[2] + t[3], worker))
                curTime += t[2]  // right to left.

                remainingBoxes -= 1
            } else if !lBank.isEmpty && (remainingBoxes > rBank.size + rWorker.size) {
                // left side can pass
                // left side only pass when there are more boxes
                worker = lBank.poll()!
                let t = time[worker]
                rWorker.add((curTime + t[0] + t[1], worker))
                curTime += t[0]  // left to right.
            } else if remainingBoxes == rBank.size + rWorker.size {
                curTime = rWorker.peek()!.0
            } else {
                // if still empty, advance time
                let nxt: Int
                if rWorker.isEmpty {
                    nxt = lWorker.peek()!.0
                } else if lWorker.isEmpty {
                    nxt = rWorker.peek()!.0
                } else {
                    nxt = min(lWorker.peek()!.0, rWorker.peek()!.0)
                }

                curTime = nxt
            }
        }

        return curTime
    }
}

// Wrapper class for PriorityQueue
struct PriorityQueue<Element> {
    private var heap: [Element]
    private let comparator: (Element, Element) -> Bool

    init(comparator: @escaping (Element, Element) -> Bool) {
        self.heap = []
        self.comparator = comparator
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    var size: Int {
        return heap.count
    }

    func peek() -> Element? {
        return heap.first
    }

    mutating func add(_ element: Element) {
        heap.append(element)
        swim(heap.count - 1)
    }

    mutating func poll() -> Element? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }

        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        sink(0)

        return element
    }

    private mutating func swim(_ index: Int) {
        var childIndex = index
        var parentIndex = (childIndex - 1) / 2

        while childIndex > 0 && comparator(heap[childIndex], heap[parentIndex]) {
            heap.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }

    private mutating func sink(_ index: Int) {
        var parentIndex = index

        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var candidateIndex = parentIndex

            if leftChildIndex < heap.count && comparator(heap[leftChildIndex], heap[candidateIndex])
            {
                candidateIndex = leftChildIndex
            }
            if rightChildIndex < heap.count
                && comparator(heap[rightChildIndex], heap[candidateIndex])
            {
                candidateIndex = rightChildIndex
            }

            if candidateIndex == parentIndex {
                return
            }

            heap.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
