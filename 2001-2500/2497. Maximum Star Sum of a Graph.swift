class Solution {

    // Solution by Sergey Leschev
    // 2497. Maximum Star Sum of a Graph

    func maxStarSum(_ vals: [Int], _ edges: [[Int]], _ k: Int) -> Int {
        let n = vals.count
        
        // create graph
        var g = [[Int]](repeating: [], count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        
        var ans = Int.min
        
        // we go to each node and calculate the max sum of at most k edges connected centered node
        // given question says maximum sum of node vals with at most k edges, so we are neglecting negative vals to connected centered node
        for i in 0..<n {
            var pq = PriorityQueue<Int>()
            
            var tt = vals[i]  // adding centered node value
            
            for u in g[i] {
                pq.push(vals[u])
                if pq.size > k {
                    pq.pop()  // calculate max values of k nodes connected to centered node
                }
            }
            
            while !pq.isEmpty {
                if pq.top > 0 {
                    tt += pq.top  // we only add positive values. suppose centered node connected all -ve vals so in that case only centered node vals is max sum with zero edges
                }
                pq.pop()
            }
            
            ans = max(tt, ans)
        }
        
        return ans
    }
}

struct PriorityQueue<Element: Comparable> {
    private var elements = [Element]()
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
    
    var top: Element {
        return elements[0]
    }
    
    mutating func push(_ value: Element) {
        elements.append(value)
        siftUp(elements.count - 1)
    }
    
    mutating func pop() {
        elements.swapAt(0, elements.count - 1)
        let _ = elements.popLast()
        siftDown(0)
    }
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var parent = index
        var leftChild = 2 * parent + 1
        var rightChild = 2 * parent + 2
        var smallest = parent
        
        if leftChild < elements.count && elements[leftChild] < elements[smallest] {
            smallest = leftChild
        }
        
        if rightChild < elements.count && elements[rightChild] < elements[smallest] {
            smallest = rightChild
        }
        
        if smallest != parent {
            elements.swapAt(parent, smallest)
            siftDown(smallest)
        }
    }
}
