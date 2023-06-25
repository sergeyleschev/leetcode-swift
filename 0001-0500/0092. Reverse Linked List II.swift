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

    // 92. Reverse Linked List II
    // Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

    // Example 1:
    // Input: head = [1,2,3,4,5], left = 2, right = 4
    // Output: [1,4,3,2,5]

    // Example 2:
    // Input: head = [5], left = 1, right = 1
    // Output: [5]
     
    // Constraints:
    // The number of nodes in the list is n.
    // 1 <= n <= 500
    // -500 <= Node.val <= 500
    // 1 <= left <= right <= n
     
    // Follow up: Could you do it in one pass?

    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var left_head = head
        var left_tail: ListNode?
        var current = head
        var index = 1
        
        while index < left {
            left_tail = current
            current = current?.next
            index += 1 
        }

        var mid_tail = current
        var node0: ListNode? = current
        var node1: ListNode? = node0?.next
        var node2: ListNode? = node1?.next
        
        while index < right {
            node1?.next = node0
            node0 = node1
            node1 = node2
            node2 = node2?.next
            index += 1
        }

        if left_tail == nil {
            mid_tail?.next = node1
            return node0
            
        } else {
            left_tail?.next = node0
            mid_tail?.next = node1
            return left_head
        }
    }

}