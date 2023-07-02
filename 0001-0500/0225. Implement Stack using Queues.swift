class MyStack {

    // Solution by Sergey Leschev

    // 225. Implement Stack using Queues
    // Implement a last in first out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal queue (push, top, pop, and empty).
    // Implement the MyStack class:
    // void push(int x) Pushes element x to the top of the stack.
    // int pop() Removes the element on the top of the stack and returns it.
    // int top() Returns the element on the top of the stack.
    // boolean empty() Returns true if the stack is empty, false otherwise.
    // Notes:
    // You must use only standard operations of a queue, which means only push to back, peek/pop from front, size, and is empty operations are valid.
    // Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue), as long as you use only a queue's standard operations.

    // Example 1:
    // Input
    // ["MyStack", "push", "push", "top", "pop", "empty"]
    // [[], [1], [2], [], [], []]
    // Output
    // [null, null, null, 2, 2, false]
    // Explanation
    // MyStack myStack = new MyStack();
    // myStack.push(1);
    // myStack.push(2);
    // myStack.top(); // return 2
    // myStack.pop(); // return 2
    // myStack.empty(); // return False

    // Constraints:
    // 1 <= x <= 9
    // At most 100 calls will be made to push, pop, top, and empty.
    // All the calls to pop and top are valid.

    // Follow-up: Can you implement the stack such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer. You can use more than two queues.

    private var queue: [Int]

    init() {
        queue = [Int]()
    }

    // Push element x onto stack.
    // - Parameter x: New element.

    // - Complexity:
    //     - time: O(n), where n is the number of elements in the stack.
    //     - space: O(1), only constant space is used.

    func push(_ x: Int) {
        queue.append(x)
        for _ in 1..<queue.count {
            queue.append(queue.removeFirst())
        }
    }

    // Removes the element on top of the stack and returns that element.
    // - Returns: The element on top of the stack.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(1), only constant space is used.

    func pop() -> Int {
        queue.removeFirst()
    }

    // Get the top element.
    // - Returns: The top element.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(1), only constant space is used.

    func top() -> Int {
        queue.first ?? -1
    }

    // Returns whether the stack is empty.
    // - Returns: True if the stack is empty, otherwise returns false.

    // - Complexity:
    //     - time: O(1), only constant time is used.
    //     - space: O(1), only constant space is used.

    func empty() -> Bool {
        queue.isEmpty
    }

}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
