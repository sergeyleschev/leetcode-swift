class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 857. Minimum Cost to Hire K Workers
    // There are n workers.  The i-th worker has a quality[i] and a minimum wage expectation wage[i].
    // Now we want to hire exactly k workers to form a paid group.  When hiring a group of k workers, we must pay them according to the following rules:
    // Every worker in the paid group should be paid in the ratio of their quality compared to other workers in the paid group.
    // Every worker in the paid group must be paid at least their minimum wage expectation.
    // Return the least amount of money needed to form a paid group satisfying the above conditions.

    // Example 1:
    // Input: quality = [10,20,5], wage = [70,50,30], k = 2
    // Output: 105.00000
    // Explanation: We pay 70 to 0-th worker and 35 to 2-th worker.

    // Example 2:
    // Input: quality = [3,1,10,10,1], wage = [4,8,2,2,7], k = 3
    // Output: 30.66667
    // Explanation: We pay 4 to 0-th worker, 13.33333 to 2-th and 3-th workers seperately. 

    // Note:
    // 1 <= k <= n <= 10000, where n = quality.length = wage.length
    // 1 <= quality[i] <= 10000
    // 1 <= wage[i] <= 10000
    // Answers within 10-5 of the correct answer will be considered correct.

    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ K: Int) -> Double {
        // To minimize cost to hire workers we need to pay at lest one worker with minimum wage, if not we can scall down the pay scale for one of them and can pay less than what we are doing and still remain the pay ratio and minimum wage
        // create a workers array with each element contain [quality, wage, ratio = wage/quality]
        // sort workers by ratio so we can iterate from the beginning of workers array and still sure that if we use a ratio of j-th element we will have ratio-jth > ratio-ith, so worker i can only be paid more than what he currently get but not less than.
        // To minimize the cost, we also try to keep the quality sum as low as possible, it means that if we have two workers has same ratio, we prefer to choice employer with lower quality so their wage also lower. => we need to keep track of list of lowest quality worker => need a min-priority queue for it.
        // to be able to calculate total wage we need to pay with O(1) time, we keep track of sumq which is sum of K workers in queue
        let N = quality.count
        var workers = [[Double]](repeating: [], count: N)
        var ans: Double = 1e9
        var sumq: Double = 0
        var q = PriorityQueue(K + 1)

        for i in 0 ..< N { workers[i] = [Double(quality[i]), Double(wage[i]) / Double(quality[i])] }
        workers.sort(by: { $0[1] < $1[1] })

        for w in workers {
            q.insert(Int(-w[0]))
            sumq += w[0]
            if q.size > K { sumq += Double(q.extractMin()) }
            if q.size == K { ans = min(ans, sumq * Double(w[1])) }
        }

        return ans
    }

}


public struct PriorityQueue { // need a min heap
    public private(set) var size = 0
    private var limit: Int
    private var arr: [Int]


    init(_ limit: Int) {
        self.limit = limit
        self.arr = [Int](repeating: -1, count: limit)
    }


    func left(_ i: Int) -> Int { 2 * i + 1 }
    func right(_ i: Int) -> Int { 2 * i + 2 }
    func parent(_ i: Int) -> Int { (i - 1) / 2 }


    mutating func insert(_ val: Int) {
        arr[size] = val
        size += 1
        shiftUp(size - 1)
    }


    mutating func extractMin() -> Int {
        let ans = arr[0]
        arr.swapAt(0, size - 1)
        size -= 1
        shiftDown(0)
        return ans
    }


    mutating func shiftUp(_ i: Int) {
        var i = i
        while arr[i] < arr[parent(i)] {
            arr.swapAt(i, parent(i))
            i = parent(i)
        }
    }


    mutating func shiftDown(_ i: Int) {
        var i = i
        while i < size {
            var swapChild = i
            let l = left(i)
            let r = right(i)
            if l < size && arr[i] > arr[l] { swapChild = l }
            if r < size && arr[l] > arr[r] { swapChild = r }
            if i == swapChild { break }
            arr.swapAt(i, swapChild)
            i = swapChild
        }
    }

}