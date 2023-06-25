class TreeAncestor {

    // Solution @ Sergey Leschev

    // 1483. Kth Ancestor of a Tree Node
    // You are given a tree with n nodes numbered from 0 to n - 1 in the form of a parent array parent where parent[i] is the parent of ith node. The root of the tree is node 0. Find the kth ancestor of a given node.
    // The kth ancestor of a tree node is the kth node in the path from that node to the root node.
    // Implement the TreeAncestor class:
    // TreeAncestor(int n, int[] parent) Initializes the object with the number of nodes in the tree and the parent array.
    // int getKthAncestor(int node, int k) return the kth ancestor of the given node node. If there is no such ancestor, return -1.

    // Example 1:
    // Input
    // ["TreeAncestor", "getKthAncestor", "getKthAncestor", "getKthAncestor"]
    // [[7, [-1, 0, 0, 1, 1, 2, 2]], [3, 1], [5, 2], [6, 3]]
    // Output
    // [null, 1, 0, -1]

    // Explanation
    // TreeAncestor treeAncestor = new TreeAncestor(7, [-1, 0, 0, 1, 1, 2, 2]);
    // treeAncestor.getKthAncestor(3, 1); // returns 1 which is the parent of 3
    // treeAncestor.getKthAncestor(5, 2); // returns 0 which is the grandparent of 5
    // treeAncestor.getKthAncestor(6, 3); // returns -1 because there is no such ancestor

    // Constraints:
    // 1 <= k <= n <= 5 * 10^4
    // parent.length == n
    // parent[0] == -1
    // 0 <= parent[i] < n for all 0 < i < n
    // 0 <= node < n
    // There will be at most 5 * 10^4 queries.

    private var fa: [[Int]]
    private var N: Int


    init(_ n: Int, _ parent: [Int]) {
        N = Int(log2(Double(n))) + 2
        fa = [[Int]](repeating: [Int](repeating: -1, count: N), count: n)
        
        for node in 0..<n { fa[node][0] = parent[node] }
        for i in 1...N {
            for node in 0..<n where fa[node][i - 1] != -1 { fa[node][i] = fa[fa[node][i - 1]][i - 1] }
        }
    }

    
    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        var ans = node
        for i in 0..<N where k >> i & 1 != 0 {
            ans = fa[ans][i]
            guard ans != -1 else { return -1 }
        }
        return ans
    }

}

/**
 * Your TreeAncestor object will be instantiated and called as such:
 * let obj = TreeAncestor(n, parent)
 * let ret_1: Int = obj.getKthAncestor(node, k)
 */