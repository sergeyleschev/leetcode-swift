class MinStack {

    // Solution by Sergey Leschev

    // 155. Min Stack
    // Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
    // Implement the MinStack class:
    // MinStack() initializes the stack object.
    // void push(val) pushes the element val onto the stack.
    // void pop() removes the element on the top of the stack.
    // int top() gets the top element of the stack.
    // int getMin() retrieves the minimum element in the stack.

    // Example 1:
    // Input
    // ["MinStack","push","push","push","getMin","pop","top","getMin"]
    // [[],[-2],[0],[-3],[],[],[],[]]
    // Output
    // [null,null,null,null,-3,null,0,-2]
    // Explanation
    // MinStack minStack = new MinStack();
    // minStack.push(-2);
    // minStack.push(0);
    // minStack.push(-3);
    // minStack.getMin(); // return -3
    // minStack.pop();
    // minStack.top();    // return 0
    // minStack.getMin(); // return -2

    // Constraints:
    // -2^31 <= val <= 2^31 - 1
    // Methods pop, top and getMin operations will always be called on non-empty stacks.
    // At most 3 * 10^4 calls will be made to push, pop, top, and getMin.

    private var stack: [Node]

    init() {
        stack = [Node]()
    }

    // Push element x onto stack.
    // - Parameter x: The element.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(n), where n is the total number of operations performed.

    func push(_ x: Int) {
        let prevMin = stack.last?.min ?? Int.max
        let node = Node(value: x, min: min(prevMin, x))

        stack.append(node)
    }

    // Removes the element on top of the stack.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func pop() {
        guard !stack.isEmpty else { return }

        stack.removeLast()
    }

    // Get the top element.
    // - Returns: The top element.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func top() -> Int {
        stack.last?.value ?? -1
    }

    // Retrieve the minimum element in the stack.
    // - Returns: The minimum element.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func getMin() -> Int {
        stack.last?.min ?? -1
    }

}

struct Node {
    var value: Int
    var min: Int
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
