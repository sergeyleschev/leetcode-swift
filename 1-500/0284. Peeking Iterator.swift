// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {

    // Solution @ Sergey Leschev, Belarusian State University

    // 284. Peeking Iterator
    // Design an iterator that supports the peek operation on a list in addition to the hasNext and the next operations.
    // Implement the PeekingIterator class:
    // PeekingIterator(int[] nums) Initializes the object with the given integer array nums.
    // int next() Returns the next element in the array and moves the pointer to the next element.
    // bool hasNext() Returns true if there are still elements in the array.
    // int peek() Returns the next element in the array without moving the pointer.

    // Example 1:
    // Input
    // ["PeekingIterator", "next", "peek", "next", "next", "hasNext"]
    // [[[1, 2, 3]], [], [], [], [], []]
    // Output
    // [null, 1, 2, 2, 3, false]
    // Explanation
    // PeekingIterator peekingIterator = new PeekingIterator([1, 2, 3]); // [1,2,3]
    // peekingIterator.next();    // return 1, the pointer moves to the next element [1,2,3].
    // peekingIterator.peek();    // return 2, the pointer does not move [1,2,3].
    // peekingIterator.next();    // return 2, the pointer moves to the next element [1,2,3]
    // peekingIterator.next();    // return 3, the pointer moves to the next element [1,2,3]
    // peekingIterator.hasNext(); // return False
     
    // Constraints:
    // 1 <= nums.length <= 1000
    // 1 <= nums[i] <= 1000
    // All the calls to next and peek are valid.
    // At most 1000 calls will be made to next, hasNext, and peek.

    // Follow up: How would you extend your design to be generic and work with all types, not just integer?
    
    private var iterator: IndexingIterator<Array<Int>>
    private var nextVal: Int?
    

    init(_ arr: IndexingIterator<Array<Int>>) {
        iterator = arr
        nextVal = iterator.next()
    }
    

    // Finds the next item in the sequence.
    // - Returns: The next item.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func next() -> Int {
        let tmp = nextVal
        nextVal = iterator.next()
        return tmp ?? 0
    }
    

    // Peek the next item.
    // - Returns: The next item.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func peek() -> Int {
        nextVal ?? 0
    }
    
    
    // Finds whether or not the next item is available.
    // - Returns: True if the next item is available, otherwise returns false.

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func hasNext() -> Bool {
        nextVal != nil
    }
    
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */