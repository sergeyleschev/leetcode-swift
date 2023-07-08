class Graph {

    // Solution by Sergey Leschev
    // 2642. Design Graph With Shortest Path Calculator

    var graph: [Int: [Int: Int]]
    
    init(_ n: Int, _ edges: [[Int]]) {
        graph = [Int: [Int: Int]]()
        
        for edge in edges {
            let from = edge[0]
            let to = edge[1]
            let cost = edge[2]
            
            if graph[from] == nil {
                graph[from] = [Int: Int]()
            }
            
            graph[from]![to] = cost
        }
    }
    
    func addEdge(_ edge: [Int]) {
        let from = edge[0]
        let to = edge[1]
        let cost = edge[2]
        
        if graph[from] == nil {
            graph[from] = [Int: Int]()
        }
        
        graph[from]![to] = cost
    }
    
    func shortestPath(_ node1: Int, _ node2: Int) -> Int {
        var seen = Set<Int>()
        var heap = [(Int, Int)]()
        heap.append((0, node1))
        
        while !heap.isEmpty {
            let (cost, node) = heap.removeFirst()
            
            if node == node2 {
                return cost
            }
            
            if !seen.contains(node), let neighbors = graph[node] {
                seen.insert(node)
                
                for (kid, cost1) in neighbors {
                    heap.append((cost + cost1, kid))
                }
                
                heap.sort(by: { $0.0 < $1.0 })
            }
        }
        
        return -1
    }
}


/**
 * Your Graph object will be instantiated and called as such:
 * let obj = Graph(n, edges)
 * obj.addEdge(edge)
 * let ret_2: Int = obj.shortestPath(node1, node2)
 */