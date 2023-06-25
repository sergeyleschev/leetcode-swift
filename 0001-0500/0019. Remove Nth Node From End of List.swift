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

    // Solution @ Sergey Leschev

    // 19. Remove Nth Node From End of List
    // Given the head of a linked list, remove the nth node from the end of the list and return its head.
    // Follow up: Could you do this in one pass?

    // Example 1:
    // Input: head = [1,2,3,4,5], n = 2
    // Output: [1,2,3,5]

    // Example 2:
    // Input: head = [1], n = 1
    // Output: []

    // Example 3:
    // Input: head = [1,2], n = 1
    // Output: [1]
     
    // Constraints:
    // The number of nodes in the list is sz.
    // 1 <= sz <= 30
    // 0 <= Node.val <= 100
    // 1 <= n <= sz

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        var count = n

        while count > 0 {
            count -= 1
            fast = fast?.next
        }

        if fast == nil { return head?.next }

        while slow != nil && fast != nil {
            if fast?.next == nil { slow?.next = slow?.next?.next } // end
            slow = slow?.next
            fast = fast?.next
        }

        return head
    }

}