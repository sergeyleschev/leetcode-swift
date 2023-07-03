class Solution {

    // Solution by Sergey Leschev
    // 2577. Minimum Time to Visit a Cell In a Grid

    // Time complexity: O(mn log(mn))
    // Space complexity: O(m*n)

    func minimumTime(_ grid: [[Int]]) -> Int {
        // Check if the starting points are blocked
        if grid[0][1] > 1 && grid[1][0] > 1 {
            return -1
        }

        let n = grid.count
        let m = grid[0].count
        let dirs = [1, 0, -1, 0, 1]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        var pq = PriorityQueue<(Int, Int, Int)>(order: <)

        pq.push((grid[0][0], 0, 0))  // Start at top-left corner

        while !pq.isEmpty {
            let (time, row, col) = pq.pop()!

            if row == n - 1 && col == m - 1 {
                return time
            }

            if visited[row][col] {
                continue
            }

            visited[row][col] = true

            for i in 0..<4 {
                let r = row + dirs[i]
                let c = col + dirs[i + 1]

                if r < 0 || r >= n || c < 0 || c >= m || visited[r][c] {
                    continue
                }

                let wait = (grid[r][c] - time) % 2 == 0 ? 1 : 0  // we would have to wait 1 more extra unit of time if the difference was already odd.
                pq.push((max(grid[r][c] + wait, time + 1), r, c))
            }
        }

        return -1
    }
}

// Helper PriorityQueue implementation
struct PriorityQueue<Element> {
    private var elements: [Element]
    private let order: (Element, Element) -> Bool

    public init(order: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.order = order
    }

    public var count: Int {
        return elements.count
    }

    public var isEmpty: Bool {
        return elements.isEmpty
    }

    public mutating func push(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    public mutating func pop() -> Element? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, elements.count - 1)
        let element = elements.removeLast()
        siftDown(from: 0)

        return element
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = (childIndex - 1) / 2

        while childIndex > 0 && order(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        let count = elements.count
        var parentIndex = index

        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2

            var candidateIndex = parentIndex

            if leftChildIndex < count && order(elements[leftChildIndex], elements[candidateIndex]) {
                candidateIndex = leftChildIndex
            }

            if rightChildIndex < count && order(elements[rightChildIndex], elements[candidateIndex])
            {
                candidateIndex = rightChildIndex
            }

            if candidateIndex == parentIndex {
                return
            }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
