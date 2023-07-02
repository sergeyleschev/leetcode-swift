class MapSum {

    // Solution by Sergey Leschev

    // 677. Map Sum Pairs
    // Implement the MapSum class:
    // MapSum() Initializes the MapSum object.
    // void insert(String key, int val) Inserts the key-val pair into the map. If the key already existed, the original key-value pair will be overridden to the new one.
    // int sum(string prefix) Returns the sum of all the pairs' value whose key starts with the prefix.

    // Example 1:
    // Input
    // ["MapSum", "insert", "sum", "insert", "sum"]
    // [[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
    // Output
    // [null, null, 3, null, 5]
    // Explanation
    // MapSum mapSum = new MapSum();
    // mapSum.insert("apple", 3);
    // mapSum.sum("ap");           // return 3 (apple = 3)
    // mapSum.insert("app", 2);
    // mapSum.sum("ap");           // return 5 (apple + app = 3 + 2 = 5)

    // Constraints:
    // 1 <= key.length, prefix.length <= 50
    // key and prefix consist of only lowercase English letters.
    // 1 <= val <= 1000
    // At most 50 calls will be made to insert and sum.

    // - Time complexity:
    //      - Insert: O(n)
    //      - Search: O(mlogm) m is current longest depth of the Trie

    class TrieNode {
        var val: Int = 0
        var child: [Character: TrieNode] = [:]
    }

    var root: TrieNode

    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }

    func insert(_ key: String, _ val: Int) {
        var cur = root
        for c in key {
            if cur.child[c] == nil { cur.child[c] = TrieNode() }
            cur = cur.child[c]!
        }
        cur.val = val
    }

    func sum(_ prefix: String) -> Int {
        var cur = root
        for c in prefix {
            if cur.child[c] == nil { return 0 }
            cur = cur.child[c]!
        }
        return getChildSum(cur)
    }

    func getChildSum(_ node: TrieNode?) -> Int {
        guard let node = node else { return 0 }
        var sum = node.val
        for k in node.child.keys { sum += getChildSum(node.child[k]!) }
        return sum
    }

}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */
