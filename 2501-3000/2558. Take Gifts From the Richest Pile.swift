import Foundation

class Solution {

    // Solution by Sergey Leschev
    // 2558. Take Gifts From the Richest Pile
    // Time complexity: O(nlogn)
    // Space complexity: O(n)

    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var maxHeap = BinaryHeap(priorityFunction: >, elements: gifts)

        for _ in 0..<k {
            guard let maxElement = maxHeap.remove() else {
                break
            }
            maxHeap.insert(Int(sqrt(Double(maxElement))))
        }

        return maxHeap.reduce(0, +)
    }
}

class BinaryHeap<T> {
    private var heap = [T]()
    private let priorityFunction: (T, T) -> Bool

    init(priorityFunction: @escaping (T, T) -> Bool, elements: [T]) {
        self.priorityFunction = priorityFunction
        buildHeap(elements)
    }

    private func buildHeap(_ elements: [T]) {
        heap = elements
        for i in stride(from: (heap.count / 2 - 1), through: 0, by: -1) {
            heapify(at: i)
        }
    }

    func insert(_ element: T) {
        heap.append(element)
        var currentIndex = heap.count - 1

        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if priorityFunction(heap[currentIndex], heap[parentIndex]) {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }

    func remove() -> T? {
        guard heap.count > 0 else {
            return nil
        }

        heap.swapAt(0, heap.count - 1)
        let removedElement = heap.removeLast()
        heapify(at: 0)

        return removedElement
    }

    private func heapify(at index: Int) {
        let leftChild = 2 * index + 1
        let rightChild = 2 * index + 2
        var largest = index

        if leftChild < heap.count && priorityFunction(heap[leftChild], heap[largest]) {
            largest = leftChild
        }

        if rightChild < heap.count && priorityFunction(heap[rightChild], heap[largest]) {
            largest = rightChild
        }

        if largest != index {
            heap.swapAt(index, largest)
            heapify(at: largest)
        }
    }

    func reduce(_ initialResult: T, _ nextPartialResult: (T, T) -> T) -> T {
        return heap.reduce(initialResult, nextPartialResult)
    }
}
