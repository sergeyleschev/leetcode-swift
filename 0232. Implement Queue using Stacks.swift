class MyQueue {

    // Solution @ Sergey Leschev, Belarusian State University

    // 232. Implement Queue using Stacks
    // Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).

    // Implement the MyQueue class:
    // void push(int x) Pushes element x to the back of the queue.
    // int pop() Removes the element from the front of the queue and returns it.
    // int peek() Returns the element at the front of the queue.
    // boolean empty() Returns true if the queue is empty, false otherwise.

    // Notes:
    // You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
    // Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
    // Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.

    // Example 1:
    // Input
    // ["MyQueue", "push", "push", "peek", "pop", "empty"]
    // [[], [1], [2], [], [], []]
    // Output
    // [null, null, null, 1, 1, false]
    // Explanation
    // MyQueue myQueue = new MyQueue();
    // myQueue.push(1); // queue is: [1]
    // myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
    // myQueue.peek(); // return 1
    // myQueue.pop(); // return 1, queue is [2]
    // myQueue.empty(); // return false

    // Constraints:
    // 1 <= x <= 9
    // At most 100 calls will be made to push, pop, peek, and empty.
    // All the calls to pop and peek are valid.

    private var input: [Int]
    private var output: [Int]


    init() {
        input = [Int]()
        output = [Int]()
    }


    // Push element x to the back of queue.
    // - Parameter x: New element.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(n), where n is the number of elements in the queue.

    func push(_ x: Int) {
        input.append(x)
    }


    // Removes the element from in front of queue and returns that element.
    // - Returns: First element in the queue.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(1), only constant space is used.
    
    func pop() -> Int {
        peek()
        return output.removeLast()
    }


    // Get the front element.
    // - Returns: First element in the queue.

    // - Complexity:
    //     - time: O(n), where n is the number of elements in the queue.
    //     - space: O(1), only constant space is used.

    func peek() -> Int {
        guard output.isEmpty else { return output.last ?? -1 }
        while !input.isEmpty { output.append(input.removeLast()) }
        return output.last ?? -1
    }


    // Returns whether the queue is empty.
    // - Returns: True if the queue is empty, otherwise returns false.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(1), only constant space is used.
    
    func empty() -> Bool {
        input.isEmpty && output.isEmpty
    }

}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */