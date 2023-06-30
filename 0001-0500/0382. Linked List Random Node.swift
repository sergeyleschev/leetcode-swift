/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {

    // Solution by Sergey Leschev

    // 382. Linked List Random Node
    // Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

    // Example 1:
    // Input
    // ["Solution", "getRandom", "getRandom", "getRandom", "getRandom", "getRandom"]
    // [[[1, 2, 3]], [], [], [], [], []]
    // Output
    // [null, 1, 3, 2, 2, 3]
    // Explanation
    // Solution solution = new Solution([1, 2, 3]);
    // solution.getRandom(); // return 1
    // solution.getRandom(); // return 3
    // solution.getRandom(); // return 2
    // solution.getRandom(); // return 2
    // solution.getRandom(); // return 3
    // // getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
     
    // Constraints:
    // The number of nodes in the linked list will be in the range [1, 10^4].
    // -10^4 <= Node.val <= 10^4
    // At most 10^4 calls will be made to getRandom.
     
    // Follow up:
    // What if the linked list is extremely large and its length is unknown to you?
    // Could you solve this efficiently without using extra space?

    private let head: ListNode?


    // Initialize data structure.
    // - Parameter head: The linked list head.

    init(_ head: ListNode?) {
        self.head = head
    }


    // Returns a random node's value from the linked list.
    // - Returns: A random node's value.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func getRandom() -> Int {
        var scope = 1.0
        var ans = 0

        var curr = head
        while let node = curr {
            if Double.random(in: 0..<1) < 1.0 / scope { ans = node.val }
            scope += 1
            curr = curr?.next
        }

        return ans
    }

}


/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */