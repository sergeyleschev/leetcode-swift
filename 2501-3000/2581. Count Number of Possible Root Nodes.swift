class Solution {

    // Solution by Sergey Leschev
    // 2581. Count Number of Possible Root Nodes

    // Space Complexity: O(N)
    // Time Complexity: O(N)

    private var parents: [Int] = []  // parents[i] => parent of vertex i if tree was rooted at vertex 0
    private var answer = 0  // required answer
    private var k = 0
    private var tree: [[Int]] = []
    private var guessGraph: [Set<Int>] = []

    func rootCount(_ edges: [[Int]], _ guesses: [[Int]], _ k: Int) -> Int {
        self.tree = Array(repeating: [], count: edges.count + 1)
        self.guessGraph = Array(repeating: [], count: edges.count + 1)
        self.k = k

        for edge in edges {
            tree[edge[0]].append(edge[1])  // Fill the tree
            tree[edge[1]].append(edge[0])
        }

        for guess in guesses {
            guessGraph[guess[0]].insert(guess[1])  // Fill guesses
        }

        parents = Array(repeating: 0, count: edges.count + 1)

        var correctGuesses = 0
        fillParent(0, -1)  // Fill the parents array

        for i in 1..<tree.count {
            let p = parents[i]
            if guessGraph[p].contains(i) { correctGuesses += 1 }  // If it's a correct guess, increase the number of guesses
        }

        if correctGuesses >= k { answer += 1 }  // If 0 is a possible node, increase answer

        for c in tree[0] { dfs(c, 0, correctGuesses) }  // Second dfs

        return answer
    }

    private func fillParent(_ node: Int, _ parent: Int) {
        parents[node] = parent

        for child in tree[node] {
            if child == parent { continue }
            fillParent(child, node)
        }
    }

    private func dfs(_ node: Int, _ parent: Int, _ correctGuesses: Int) {
        var cur = correctGuesses

        if guessGraph[parent].contains(node) { cur -= 1 }
        if guessGraph[node].contains(parent) { cur += 1 }

        if cur >= k { answer += 1 }

        for child in tree[node] {
            if child != parent {
                dfs(child, node, cur)
            }
        }
    }
}
