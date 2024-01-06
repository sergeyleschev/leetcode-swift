class Solution {

    // Solution by Sergey Leschev
    // 2940. Find Building Where Alice and Bob Can Meet

    // Time Complexity: O(q log q)
    // Space Complexity: O(q)
    // where q = queries.size

    func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
        let n = heights.count
        var que = [[[Int]]](repeating: [], count: n)
        var minHeap = Heap<[Int]>(comparator: { $0[0] < $1[0] })
        var res = [Int](repeating: -1, count: queries.count)

        // Step 1
        for (qi, query) in queries.enumerated() {
            let i = query[0]
            let j = query[1]
            if i < j && heights[i] < heights[j] {
                res[qi] = j
            } else if i > j && heights[i] > heights[j] {
                res[qi] = i
            } else if i == j {
                res[qi] = i
            } else {
                // Step 2
                que[max(i, j)].append([max(heights[i], heights[j]), qi])
            }
        }

        // Step 3
        for i in 0..<n {
            while !minHeap.isEmpty && minHeap.peek()![0] < heights[i] {
                res[minHeap.poll()![1]] = i
            }
            for q in que[i] {
                minHeap.offer(q)
            }
        }

        return res
    }
}

struct Heap<T> {
    var elements: [T]
    let comparator: (T, T) -> Bool

    init(comparator: @escaping (T, T) -> Bool) {
        self.elements = []
        self.comparator = comparator
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func offer(_ element: T) {
        elements.append(element)
        siftUp(elements.count - 1)
    }

    mutating func poll() -> T? {
        if elements.isEmpty {
            return nil
        }
        if elements.count == 1 {
            return elements.removeLast()
        }
        let result = elements[0]
        elements[0] = elements.removeLast()
        siftDown(0)
        return result
    }

    func peek() -> T? {
        return elements.first
    }

    mutating func siftUp(_ index: Int) {
        var index = index
        while index > 0 {
            let parent = (index - 1) / 2
            if comparator(elements[index], elements[parent]) {
                elements.swapAt(index, parent)
                index = parent
            } else {
                break
            }
        }
    }

    mutating func siftDown(_ index: Int) {
        var index = index
        while true {
            let leftChild = 2 * index + 1
            let rightChild = 2 * index + 2
            var smallest = index
            if leftChild < elements.count && comparator(elements[leftChild], elements[smallest]) {
                smallest = leftChild
            }
            if rightChild < elements.count && comparator(elements[rightChild], elements[smallest]) {
                smallest = rightChild
            }
            if smallest == index {
                break
            }
            elements.swapAt(index, smallest)
            index = smallest
        }
    }
}
