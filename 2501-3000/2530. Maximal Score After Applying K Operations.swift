class Solution {

    // Solution by Sergey Leschev
    // 2530. Maximal Score After Applying K Operations

    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var priorityQueue: [Int] = nums
        var answer: Int = 0

        // Convert the array to a max heap
        func heapifyUp(_ index: Int) {
            var child = index
            var parent = (child - 1) / 2
            while child > 0 && priorityQueue[parent] < priorityQueue[child] {
                priorityQueue.swapAt(parent, child)
                child = parent
                parent = (child - 1) / 2
            }
        }

        // Convert the heap back to max heap after removing the root
        func heapifyDown(_ index: Int, _ size: Int) {
            var parent = index
            var leftChild = 2 * parent + 1
            while leftChild < size {
                var largest = leftChild
                let rightChild = leftChild + 1
                if rightChild < size && priorityQueue[rightChild] > priorityQueue[leftChild] {
                    largest = rightChild
                }

                if priorityQueue[parent] >= priorityQueue[largest] {
                    break
                }

                priorityQueue.swapAt(parent, largest)
                parent = largest
                leftChild = 2 * parent + 1
            }
        }

        // Convert the input array to a max heap
        for i in (0..<nums.count / 2).reversed() {
            heapifyDown(i, nums.count)
        }

        // Loop k times as mentioned in the question
        for _ in 0..<k {
            guard let temp = priorityQueue.first else {
                break
            }
            answer += temp

            // After adding the highest element in the answer,
            // replace that number in the heap by doing the operation as told in the question ceil(num[i]/3).
            let s = Double(temp) / 3.0
            priorityQueue[0] = Int(ceil(s))
            heapifyDown(0, priorityQueue.count)
        }

        return answer
    }
}
