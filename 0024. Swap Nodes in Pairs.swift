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

    // 24. Swap Nodes in Pairs
    // Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

    // - Parameter head: Linked list head.
    // - Returns: Linked list head.

    // Example 1:
    // Input: head = [1,2,3,4]
    // Output: [2,1,4,3]

    // Example 2:
    // Input: head = []
    // Output: []

    // Example 3:
    // Input: head = [1]
    // Output: [1]
     
    // Constraints:
    // The number of nodes in the list is in the range [0, 100].
    // 0 <= Node.val <= 100

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let res = head?.next
        
        head?.next = swapPairs(res?.next)
        res?.next = head
        return res
    }

    /*
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head

        var head = head
        var prevNode: ListNode? = dummy

        while head?.next != nil {
            let firstNode = head
            let secondNode = head?.next

            prevNode?.next = secondNode
            firstNode?.next = secondNode?.next
            secondNode?.next = firstNode

            prevNode = firstNode
            head = firstNode?.next
        }

        return dummy.next
    }
    */
}