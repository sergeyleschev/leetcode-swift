class MyLinkedList {

    // Solution by Sergey Leschev

    // 707. Design Linked List
    // Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
    // A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
    // If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
    // Implement the MyLinkedList class:
    // MyLinkedList() Initializes the MyLinkedList object.
    // int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
    // void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    // void addAtTail(int val) Append a node of value val as the last element of the linked list.
    // void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
    // void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.

    // Example 1:
    // Input
    // ["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
    // [[], [1], [3], [1, 2], [1], [1], [1]]
    // Output
    // [null, null, null, null, 2, null, 3]
    // Explanation
    // MyLinkedList myLinkedList = new MyLinkedList();
    // myLinkedList.addAtHead(1);
    // myLinkedList.addAtTail(3);
    // myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
    // myLinkedList.get(1);              // return 2
    // myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
    // myLinkedList.get(1);              // return 3

    // Constraints:
    // 0 <= index, val <= 1000
    // Please do not use the built-in LinkedList library.
    // At most 2000 calls will be made to get, addAtHead, addAtTail, addAtIndex and deleteAtIndex.

    private class Node {
        let val: Int
        var next: Node?

        init(val: Int, next: Node?) {
            self.val = val
            self.next = next
        }
    }

    private var head: Node?

    init() { head = nil }

    func get(_ index: Int) -> Int {
        var index = index
        var temp = head

        while index > 0 {
            temp = temp?.next
            index -= 1
        }

        return temp?.val ?? -1
    }

    func addAtHead(_ val: Int) {
        head = Node(val: val, next: head)
    }

    func addAtTail(_ val: Int) {
        var tail = head

        while tail?.next != nil { tail = tail?.next }

        if tail == nil {
            head = Node(val: val, next: nil)
        } else {
            tail?.next = Node(val: val, next: nil)
        }
    }

    func addAtIndex(_ index: Int, _ val: Int) {
        var index = index
        var temp = head
        var prev: Node?

        while index > 0 {
            prev = temp
            temp = temp?.next
            index -= 1
        }

        if prev == nil {
            head = Node(val: val, next: temp)
        } else {
            prev?.next = Node(val: val, next: temp)
        }
    }

    func deleteAtIndex(_ index: Int) {
        var index = index
        var temp = head
        var prev: Node?

        while index > 0 {
            prev = temp
            temp = temp?.next
            index -= 1
        }

        if prev == nil {
            head = temp?.next
            temp?.next = nil
        } else {
            prev?.next = temp?.next
            temp?.next = nil
        }
    }

}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
