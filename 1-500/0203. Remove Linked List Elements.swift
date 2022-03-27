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

    // Solution @ Sergey Leschev, Belarusian State University

    // 203. Remove Linked List Elements
    // Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

    // Removes all elements from a linked list of integers that have value *val*.

    // - Parameters:
    //   - head: Linked list head.
    //   - val: The value.
    // - Returns: Linked list head.

    // Example 1:
    // Input: head = [1,2,6,3,4,5,6], val = 6
    // Output: [1,2,3,4,5]

    // Example 2:
    // Input: head = [], val = 1
    // Output: []

    // Example 3:
    // Input: head = [7,7,7,7], val = 7
    // Output: []
     
    // Constraints:
    // The number of nodes in the list is in the range [0, 10^4].
    // 1 <= Node.val <= 50
    // 0 <= k <= 50

    // - Complexity:
    //   - time: O(n), where n is the number of nodes.
    //   - space: O(1), only constant space is used.

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var cur: ListNode? = dummy

        while cur?.next != nil {
            if let curVal = cur?.next?.val, curVal == val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }

        return dummy.next
    }

}