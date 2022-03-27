class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 373. Find K Pairs with Smallest Sums
    // You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.
    // Define a pair (u, v) which consists of one element from the first array and one element from the second array.
    // Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.

    // Example 1:
    // Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
    // Output: [[1,2],[1,4],[1,6]]
    // Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]

    // Example 2:
    // Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
    // Output: [[1,1],[1,1]]
    // Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]

    // Example 3:
    // Input: nums1 = [1,2], nums2 = [3], k = 3
    // Output: [[1,3],[2,3]]
    // Explanation: All possible pairs are returned from the sequence: [1,3],[2,3]

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 10^4
    // -10^9 <= nums1[i], nums2[i] <= 10^9
    // nums1 and nums2 both are sorted in ascending order.
    // 1 <= k <= 1000

    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var queue = Heap<(Int, Int, Int)>(elements: []) { ($0.0 + $0.1) < ($1.0 + $1.1) }
        var ret: [[Int]] = []
        guard nums1.count > 0 && nums2.count > 0 && k > 0 else { return [] }

        for i in (0 ..< min(nums1.count , k)) {
            queue.enqueue((nums1[i], nums2[0], 0))
        }

        var k = k
        for _ in 0..<k where !queue.isEmpty {
            let cur = queue.dequeue()!
            ret.append([cur.0, cur.1])
            if cur.2 < nums2.count - 1 {
                queue.enqueue((cur.0, nums2[cur.2 + 1], cur.2 + 1))
            }
        }

        return ret
    }

}


struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }


    init(elements: [Element], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }


    func peek() -> Element? { return elements.first }


    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }


    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty { siftDown(elementAtIndex: 0) }
        return element
    }


    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }


    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }


    func childs(of index: Int) -> (left: Int, right: Int) {
        return (2 * index + 1, 2 * index + 2)
    }


    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }


    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }


    func higherPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count else { return parentIndex }
        return isHigherPriority(at: childIndex, than: parentIndex) ? childIndex : parentIndex
    }


    func highestPriorityIndex(for node: Int) -> Int {
        let (left, right) = childs(of: node)
        return higherPriorityIndex(of: higherPriorityIndex(of: node, and: left), and: right)
    }


    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }


    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
        else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }


    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard childIndex != index else { return }
        swapElement(at: childIndex, with: index)
        siftDown(elementAtIndex: childIndex)
    }

}