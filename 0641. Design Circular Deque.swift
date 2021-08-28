class MyCircularDeque {

    // Solution @ Sergey Leschev, Belarusian State University

    // 641. Design Circular Deque
    // Design your implementation of the circular double-ended queue (deque).
    // Your implementation should support following operations:
    // MyCircularDeque(k): Constructor, set the size of the deque to be k.
    // insertFront(): Adds an item at the front of Deque. Return true if the operation is successful.
    // insertLast(): Adds an item at the rear of Deque. Return true if the operation is successful.
    // deleteFront(): Deletes an item from the front of Deque. Return true if the operation is successful.
    // deleteLast(): Deletes an item from the rear of Deque. Return true if the operation is successful.
    // getFront(): Gets the front item from the Deque. If the deque is empty, return -1.
    // getRear(): Gets the last item from Deque. If the deque is empty, return -1.
    // isEmpty(): Checks whether Deque is empty or not. 
    // isFull(): Checks whether Deque is full or not.
     
    // Example:
    // MyCircularDeque circularDeque = new MycircularDeque(3); // set the size to be 3
    // circularDeque.insertLast(1);            // return true
    // circularDeque.insertLast(2);            // return true
    // circularDeque.insertFront(3);           // return true
    // circularDeque.insertFront(4);           // return false, the queue is full
    // circularDeque.getRear();            // return 2
    // circularDeque.isFull();             // return true
    // circularDeque.deleteLast();         // return true
    // circularDeque.insertFront(4);           // return true
    // circularDeque.getFront();           // return 4

    // Note:
    // All values will be in the range of [0, 1000].
    // The number of operations will be in the range of [1, 1000].
    // Please do not use the built-in Deque library.
    
    class Node {
        var val: Int
        var next: Node?
        var perv: Node?

        init(val: Int) { self.val = val }
    }
    

    private let capacity: Int
    private(set) var count = 0
    private let head = Node(val: -1)
    private let tail = Node(val: -1)
    
    
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.capacity = k
        self.head.next = self.tail
        self.head.perv = self.tail
        self.tail.perv = self.head
        self.tail.next = self.head
    }
    

    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        guard capacity > count else { return false }
        count += 1
        let node = Node(val: value)
        node.next = head.next
        node.perv = head
        head.next?.perv = node
        head.next = node
        return true
    }
    

    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        guard capacity > count else { return false }
        count += 1
        let node = Node(val: value)
        node.next = tail
        node.perv = tail.perv
        tail.perv?.next = node
        tail.perv = node
        return true
    }
    

    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        guard !isEmpty() else { return false }
        count -= 1
        let tmp = head.next
        head.next?.next?.perv = head
        head.next = head.next?.next
        tmp?.perv = nil
        tmp?.next = nil
        return true
    }
    

    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        guard !isEmpty() else { return false }
        count -= 1
        let tmp = tail.perv
        tail.perv?.perv?.next = tail
        tail.perv = tail.perv?.perv
        tmp?.next = nil
        tmp?.perv = nil
        return true
    }
    

    /** Get the front item from the deque. */
    func getFront() -> Int { head.next?.val ?? -1 }
    

    /** Get the last item from the deque. */
    func getRear() -> Int { tail.perv?.val ?? -1 }
    

    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool { count == 0 }
    

    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool { count == capacity }

}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */