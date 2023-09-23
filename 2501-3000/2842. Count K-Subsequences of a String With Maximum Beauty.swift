class Solution {

    // Solution by Sergey Leschev
    // 2842. Count K-Subsequences of a String With Maximum Beauty

    let MOD = 1_000_000_007

    func power(_ x: Int, _ n: Int) -> Int {
        if n == 0 {
            return 1
        }

        var ans = power(x, n / 2)
        ans = (ans * ans) % MOD

        if n % 2 != 0 {
            ans = (ans * x) % MOD
        }

        return ans
    }

    func fact(_ n: Int) -> Int {
        var ans = 1

        for i in 1...n {
            ans = (ans * i) % MOD
        }

        return ans
    }

    func nCr(_ n: Int, _ r: Int) -> Int {
        let ans = fact(n)
        let denominator = (fact(r) * fact(n - r)) % MOD

        return (ans * power(denominator, MOD - 2)) % MOD
    }

    func countKSubsequencesWithMaxBeauty(_ s: String, _ k: Int) -> Int {
        var pq = PriorityQueue<Int>()

        var freq = Array(repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            freq[index] += 1
        }

        for i in 0..<26 {
            if freq[i] > 0 {
                pq.push(freq[i])
            }
        }

        if pq.count < k {
            return 0
        }

        var ans: Int = 1
        var k = k
        while k > 0 {
            var countEqual = 0
            var ele = pq.top()
            while pq.count > 0 && pq.top() == ele {
                countEqual += 1
                pq.pop()
            }

            if countEqual <= k {
                k -= countEqual
                ans = (ans * power(ele, countEqual)) % MOD
            } else {
                ans = (ans * power(ele, k)) % MOD
                ans = (ans * nCr(countEqual, k)) % MOD
                break
            }
        }

        return ans
    }
}

struct PriorityQueue<T: Comparable> {
    private var array = [T]()

    mutating func push(_ element: T) {
        array.append(element)
        siftUp(array.count - 1)
    }

    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && array[child] > array[parent] {
            array.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func pop() {
        array[0] = array[array.count - 1]
        array.removeLast()
        siftDown(0)
    }

    private mutating func siftDown(_ index: Int) {
        var parent = index

        while true {
            let leftChild = 2 * parent + 1
            let rightChild = leftChild + 1
            var maxChild = parent

            if leftChild < array.count && array[leftChild] > array[maxChild] {
                maxChild = leftChild
            }

            if rightChild < array.count && array[rightChild] > array[maxChild] {
                maxChild = rightChild
            }

            if parent == maxChild {
                return
            }

            array.swapAt(parent, maxChild)
            parent = maxChild
        }
    }

    func top() -> T {
        return array[0]
    }

    var count: Int {
        return array.count
    }
}
