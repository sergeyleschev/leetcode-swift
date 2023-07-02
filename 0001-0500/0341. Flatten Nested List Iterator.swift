/// // This is the interface that allows for creating nested lists.
/// // You should not implement it, or speculate about its implementation
/// class NestedInteger {
///     // Return true if this NestedInteger holds a single integer, rather than a nested list.
///     public func isInteger() -> Bool
///
///     // Return the single integer that this NestedInteger holds, if it holds a single integer
///     // The result is undefined if this NestedInteger holds a nested list
///     public func getInteger() -> Int
///
///     // Set this NestedInteger to hold a single integer.
///     public func setInteger(value: Int)
///
///     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
///     public func add(elem: NestedInteger)
///
///     // Return the nested list that this NestedInteger holds, if it holds a nested list
///     // The result is undefined if this NestedInteger holds a single integer
///     public func getList() -> [NestedInteger]
/// }

class NestedIterator {

    // Solution by Sergey Leschev

    // 341. Flatten Nested List Iterator
    // You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.
    // Implement the NestedIterator class:
    // NestedIterator(List<NestedInteger> nestedList) Initializes the iterator with the nested list nestedList.
    // int next() Returns the next integer in the nested list.
    // boolean hasNext() Returns true if there are still some integers in the nested list and false otherwise.
    // Your code will be tested with the following pseudocode:
    // initialize iterator with nestedList
    // res = []
    // while iterator.hasNext()
    //     append iterator.next() to the end of res
    // return res
    // If res matches the expected flattened list, then your code will be judged as correct.

    // Example 1:
    // Input: nestedList = [[1,1],2,[1,1]]
    // Output: [1,1,2,1,1]
    // Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].

    // Example 2:
    // Input: nestedList = [1,[4,[6]]]
    // Output: [1,4,6]
    // Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,4,6].

    // Constraints:
    // 1 <= nestedList.length <= 500
    // The values of the integers in the nested list is in the range [-10^6, 10^6].

    private var stack: [Int]

    init(_ nestedList: [NestedInteger]) {
        stack = []
        var nestedList = nestedList
        while !nestedList.isEmpty {
            let list = nestedList.removeFirst()
            if list.isInteger() {
                stack.append(list.getInteger())
            } else {
                nestedList.insert(contentsOf: list.getList(), at: 0)
            }
        }
    }

    func next() -> Int {
        return stack.removeFirst()
    }

    func hasNext() -> Bool {
        return !stack.isEmpty
    }

}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
