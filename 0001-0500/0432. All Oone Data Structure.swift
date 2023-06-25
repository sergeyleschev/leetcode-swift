public class ListNode {
    public var val: Int
    public var next: ListNode?
    public var prev: ListNode?
    public var lists: Set<String>
    private var size = 0
    public init(_ val: Int) {
        self.val = val
        self.lists = Set<String>()
    }
}


class AllOne {

    // Solution @ Sergey Leschev

    // 432. All O`one Data Structure
    // Design a data structure to store the strings' count with the ability to return the strings with minimum and maximum counts.
    // Implement the AllOne class:
    // AllOne() Initializes the object of the data structure.
    // inc(String key) Increments the count of the string key by 1. If key does not exist in the data structure, insert it with count 1.
    // dec(String key) Decrements the count of the string key by 1. If the count of key is 0 after the decrement, remove it from the data structure. It is guaranteed that key exists in the data structure before the decrement.
    // getMaxKey() Returns one of the keys with the maximal count. If no element exists, return an empty string "".
    // getMinKey() Returns one of the keys with the minimum count. If no element exists, return an empty string "".
     
    // Example 1:
    // Input
    // ["AllOne", "inc", "inc", "getMaxKey", "getMinKey", "inc", "getMaxKey", "getMinKey"]
    // [[], ["hello"], ["hello"], [], [], ["leet"], [], []]
    // Output
    // [null, null, null, "hello", "hello", null, "hello", "leet"]
    // Explanation
    // AllOne allOne = new AllOne();
    // allOne.inc("hello");
    // allOne.inc("hello");
    // allOne.getMaxKey(); // return "hello"
    // allOne.getMinKey(); // return "hello"
    // allOne.inc("leet");
    // allOne.getMaxKey(); // return "hello"
    // allOne.getMinKey(); // return "leet"
     
    // Constraints:
    // 1 <= key.length <= 10
    // key consists of lowercase English letters.
    // It is guaranteed that for each call to dec, key is existing in the data structure.
    // At most 3 * 10^4 calls will be made to inc, dec, getMaxKey, and getMinKey.
     
    // Follow up: Could you apply all the operations in O(1) time complexity?


    var head: ListNode
    var tail: ListNode
    var map = [String: ListNode]()

    
    /** Initialize your data structure here. */
    init() {
        head = ListNode(0)
        tail = ListNode(0)
        head.next = tail
        tail.prev = head
    }


    /** Inserts a new key <Key> with value 1. Or increments an existing key by 1. */
    func inc(_ key: String) {
        if let curNode = map[key] {
            attachToNext(curNode, key)
            reset(curNode, key)
        } else {
            attachToNext(head, key)
        }
    }


    /** Decrements an existing key by 1. If Key's value is 1, remove it from the data structure. */
    func dec(_ key: String) {
        guard let curNode = map[key] else { return }
        attachToPrev(curNode, key)
        reset(curNode, key)
    }


    private func attachToNext(_ curNode: ListNode, _ key: String) {
        let nextNode = curNode.next!
        let v = curNode.val + 1
        if nextNode.val == v {
            map[key] = nextNode
            nextNode.lists.insert(key)
        } else {
            let newNode = ListNode(v)
            newNode.lists.insert(key)
            map[key] = newNode
            nextNode.prev = newNode
            newNode.next = nextNode
            curNode.next = newNode
            newNode.prev = curNode
        }
    }


    private func attachToPrev(_ curNode: ListNode, _ key: String) {
        let prevNode = curNode.prev!
        let v = curNode.val - 1
        if prevNode.val == v {
            map[key] = prevNode
            prevNode.lists.insert(key)
        } else {
            if v != 0 {
                let newNode = ListNode(v)
                newNode.lists.insert(key)
                map[key] = newNode
                prevNode.next = newNode
                newNode.prev = prevNode
                curNode.prev = newNode
                newNode.next = curNode
            } else {
                map[key] = nil
            }
        }
    }


    private func reset(_ curNode: ListNode, _ key: String) {
        curNode.lists.remove(key)
        if curNode.lists.count == 0 {
            if let pre = curNode.prev, let nxt = curNode.next {
                pre.next = nxt
                nxt.prev = pre
            }
        }
    }


    /** Returns one of the keys with maximal value. */
    func getMaxKey() -> String {
        guard let strs = tail.prev?.lists else { return "" }
        guard let key = strs.first else { return "" }
        return key
    }


    /** Returns one of the keys with Minimal value. */
    func getMinKey() -> String {
        guard let strs = head.next?.lists else { return "" }
        guard let key = strs.first else { return "" }
        return key
    }

}

/**
 * Your AllOne object will be instantiated and called as such:
 * let obj = AllOne()
 * obj.inc(key)
 * obj.dec(key)
 * let ret_3: String = obj.getMaxKey()
 * let ret_4: String = obj.getMinKey()
 */